FactoryGirl.define do
  factory :task do
    name { Faker::Hacker.noun }
    external { [true, false].sample }
    ip { Faker::Internet.ip_v4_address }

    factory :task_with_instances do
      transient do
        instances_count { rand(4) + 1 }
      end

      after :create do |task, e|
        FactoryGirl.create_list(:instance_with_logs, e.instances_count, task: task)
      end
    end
  end
end
