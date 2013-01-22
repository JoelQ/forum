module ApplicationHelper

  def authorized_only_edit_link(path, resource)
    if can? :update, resource
      link_to t(:edit), path
    end
  end

  def authorized_only_delete_link(path, resource)
    if can? :destroy, resource
      link_to 'Delete', path, method: :delete, id: "delete-#{resource.id}"
    end
  end
end
