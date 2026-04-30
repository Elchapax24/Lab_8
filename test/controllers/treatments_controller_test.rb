require "test_helper"

class TreatmentsControllerTest < ActionDispatch::IntegrationTest
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

    @treatment = Treatment.create!(
      appointment: @appointment,
      name: "Vaccine",
      medication: "Rabies",
      dosage: "1 dose",
      notes: "OK",
      administered_at: Time.now
    )
  end

  test "should get new" do
    get new_appointment_treatment_url(@appointment)
    assert_response :success
  end

  test "should create treatment" do
    assert_difference("Treatment.count") do
      post appointment_treatments_url(@appointment), params: {
        treatment: {
          name: "New Treatment",
          medication: "Med",
          dosage: "1x",
          notes: "Notes",
          administered_at: Time.now
        }
      }
    end

    assert_redirected_to appointment_path(@appointment)
  end

  test "should not create invalid treatment" do
    assert_no_difference("Treatment.count") do
      post appointment_treatments_url(@appointment), params: {
        treatment: { name: "" }
      }
    end

    assert_response :unprocessable_entity
  end

  test "should update treatment" do
    patch appointment_treatment_url(@appointment, @treatment), params: {
      treatment: { name: "Updated" }
    }

    assert_redirected_to appointment_path(@appointment)
  end

  test "should destroy treatment" do
    assert_difference("Treatment.count", -1) do
      delete appointment_treatment_url(@appointment, @treatment)
    end

    assert_redirected_to appointment_path(@appointment)
  end
end