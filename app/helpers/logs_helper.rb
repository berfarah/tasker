module LogsHelper
  def of_instance
    id = params[:instance_id]
    return unless id
    ' of '.html_safe <<
      link_to("Instance #{id}", instance_path(id))
  end
end
