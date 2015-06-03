module TasksHelper
  def sd(runtime)
    runtime.last
  end

  def average(runtime)
    runtime.first
  end
end
