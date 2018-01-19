class Admin::EntitiesController < AdminController
  layout 'layouts/admin/entities/entities_layout'

  def index
    @entities = Entity.all
  end
end
