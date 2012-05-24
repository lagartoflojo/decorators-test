class ShoeDecorator < BaseDecorator
  allow :brand

  def show_link
    h.link_to name, model
  end

  def edit_link
    h.link_to 'Editar', h.edit_shoe_path(model)
  end

  def name
    "#{model.name} (by #{brand})"
  end
end