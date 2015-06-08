#!/usr/bin/env ruby
require 'pathname'
require 'time'

# path to your application root.
APP_ROOT = Pathname.new File.expand_path('../../',  __FILE__)

mode = ARGV[0] || 'backup'

def back_up(container)
  system 'mkdir -p backup'
  system "docker exec -t #{container} pg_dumpall -c > "\
         "backup/db_#{today}.sql"
end

def cronjob(time = 2)
  system "echo \"0 #{time} * * * /bin/bash -l -c '#{__FILE__}'\" | crontab"
end

def restore(date_string, container)
  return unless File.directory? 'backup'
  system "cat backup/db_#{date(date_string)} | docker exec -i #{container} "\
         'psql -Upostgres'
end

def today
  @today ||= Time.now.strftime('%Y-%M-%d')
end

def date(string)
  @date ||= Time.parse(string).strftime('%Y-%M-%d')
end

Dir.chdir APP_ROOT do
  container = `docker-compose ps | grep -o ".*_db_\\d*"`.strip

  case mode
  when 'backup' then back_up container
  when 'restore'
    return puts 'Need a date as second argument' unless ARGV[1]
    restore ARGV[1], container
  when 'cron' then cronjob(ARGV[1] || 2)
  end
end
