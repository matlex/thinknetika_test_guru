module ApplicationHelper
  BOOTSTRAP_FLASH_CLASSES = Hash.new('alert alert-primary').tap do |hash|
    hash[:notice] = 'alert alert-info'
    hash[:success] = 'alert alert-success'
    hash[:error] = 'alert alert-danger'
    hash[:alert] = 'alert alert-warning'
  end

  def flash_class(level)
    BOOTSTRAP_FLASH_CLASSES[level]
  end
end
