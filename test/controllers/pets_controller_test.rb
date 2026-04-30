require "test_helper"

class PetsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @owner = Owner.create!(
      first_name: "Test",
      last_name: "Owner",
      email: "owner@test.com",
      phone: "123",
      address: "Test"
    )

    @pet = Pet.create!(
      name: "Firulais",
      species: "dog",
      breed: "Labrador",
      date_of_birth: "2020-01-01",
      weight: 10,
      owner: @owner
    )
  end

  test "should get index" do
    get pets_url
    assert_response :success
  end

  test "should get show" do
    get pet_url(@pet)
    assert_response :success
  end

  test "should create pet with valid params" do
    assert_difference("Pet.count") do
      post pets_url, params: {
        pet: {
          name: "NewPet",
          species: "dog",
          breed: "Test",
          date_of_birth: "2020-01-01",
          weight: 5,
          owner_id: @owner.id
        }
      }
    end

    assert_redirected_to pet_path(Pet.last)
  end

  test "should not create pet with invalid params" do
    assert_no_difference("Pet.count") do
      post pets_url, params: {
        pet: { name: "" }
      }
    end

    assert_response :unprocessable_entity
  end

  test "should update pet" do
    patch pet_url(@pet), params: {
      pet: { name: "Updated" }
    }

    assert_redirected_to pet_path(@pet)
  end

  test "should destroy pet" do
    assert_difference("Pet.count", -1) do
      delete pet_url(@pet)
    end

    assert_redirected_to pets_path
  end
end