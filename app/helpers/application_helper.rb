module ApplicationHelper

  def authorized_only_edit_link(path, resource, options={})
    if can? :update, resource
      link_to t('helpers.submit.update', model: resource.class.model_name.human), path, options
    end
  end

  def authorized_only_delete_link(path, resource)
    if can? :destroy, resource
      link_to 'Delete', path, method: :delete, id: "delete-#{resource.id}"
    end
  end
end
