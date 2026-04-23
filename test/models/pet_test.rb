require "test_helper"

class PetTest < ActiveSupport::TestCase

  test "valid pet" do
    pet = Pet.new(
      name: "Firulais",
      species: "dog",
      date_of_birth: Date.today - 1.year,
      weight: 10,
      owner: owners(:one)
    )
    assert pet.valid?
  end

  test "invalid without name" do
    pet = Pet.new
    assert_not pet.valid?
    assert_includes pet.errors[:name], "can't be blank"
  end

end