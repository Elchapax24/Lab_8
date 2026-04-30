require "test_helper"

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
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

    @vet = Vet.create!(
      first_name: "Ana",
      last_name: "Vet",
      email: "vet@test.com",
      phone: "123",
      specialization: "General"
    )

    @appointment = Appointment.create!(
      pet: @pet,
      vet: @vet,
      date: Time.now,
      reason: "Check",
      status: :scheduled
    )
  end

  test "should get index" do
    get appointments_url
    assert_response :success
  end

  test "should get show" do
    get appointment_url(@appointment)
    assert_response :success
  end

  test "should create appointment" do
    assert_difference("Appointment.count") do
      post appointments_url, params: {
        appointment: {
          pet_id: @pet.id,
          vet_id: @vet.id,
          date: Time.now,
          reason: "Test",
          status: "scheduled"
        }
      }
    end

    assert_redirected_to appointment_path(Appointment.last)
  end

  test "should not create invalid appointment" do
    assert_no_difference("Appointment.count") do
      post appointments_url, params: {
        appointment: { reason: "" }
      }
    end

    assert_response :unprocessable_entity
  end

  test "should update appointment" do
    patch appointment_url(@appointment), params: {
      appointment: { reason: "Updated" }
    }

    assert_redirected_to appointment_path(@appointment)
  end

  test "should destroy appointment" do
    assert_difference("Appointment.count", -1) do
      delete appointment_url(@appointment)
    end

    assert_redirected_to appointments_path
  end
end