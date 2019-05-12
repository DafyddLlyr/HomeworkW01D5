def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, amount)
  shop[:admin][:total_cash] += amount
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, num_of_pets)
  shop[:admin][:pets_sold] += num_of_pets
end

def stock_count(shop)
  return shop[:pets].length()
end

def pets_by_breed(shop, breed)
  array_of_pets = []
  for pet in shop[:pets]
    array_of_pets.push(pet) if pet[:breed] == breed
  end
  return array_of_pets
end

def find_pet_by_name(shop, name)
  for pet in shop[:pets]
    return pet if pet[:name] == name
  end
  return nil
end

def remove_pet_by_name(shop, name)
  for pet in shop[:pets]
    shop[:pets].delete(pet) if pet[:name] == name
  end
end

def add_pet_to_stock(shop, pet)
  shop[:pets].push(pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].length()
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end

  # # OPTIONAL

def customer_can_afford_pet(customer, pet)
  return customer[:cash] >= pet[:price]
end

def sell_pet_to_customer(shop, pet, customer)
  if pet != nil && customer_can_afford_pet(customer, pet)
    add_pet_to_customer(customer, pet)
    increase_pets_sold(shop, 1)
    remove_customer_cash(customer, pet[:price])
    add_or_remove_cash(shop, pet[:price])
  end
end
