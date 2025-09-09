class Inventory < ApplicationRecord
  
  def reserve_inventory reserve_quantity
    if reserve_quantity > self.actual_quantity || self.reserved_quantity + reserve_quantity > self.actual_quantity
      puts "Insuffiecient inventory"
    else
      self.reserved_quantity += reserve_quantity
      save
    end
  end

  def release_inventory release_quantity
    self.reserved_quantity -= release_quantity
    save
  end

  def confirm_reservation confirm_quantity
    if confirm_quantity > self.actual_quantity || self.actual_quantity - confirm_quantity
      puts "Insuffiecient inventory"
    else
      self.reserved_quantity -= confirm_quantity
      self.expected_quantity -= confirm_quantity
      save
    end
  end

  def deliver deliver_quantity
    if deliver_quantity > self.actual_quantity
      puts "Insuffiecient inventory"
    else
      self.actual_quantity -= deliver_quantity
      save
    end
  end

  def compensate_inventory compensate_quantity
    self.actual_quantity += compensate_quantity
    save  
  end

end
