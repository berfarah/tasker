module TasksHelper
  def sd(runtime)
    runtime.last
  end

  def average(runtime)
    runtime.first
  end

  def enabled(bool)
    bool ? 'enabled' : 'disabled'
  end
end
