require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    dmv_service = DmvDataService.new

    allow(dmv_service).to receive(:wa_ev_registrations).and_return(wa_ev_reg_test_data)
    # @wa_ev_registrations = dmv_service.wa_ev_registrations
    # allow(@wa_ev_registrations).to receive(:data).and_return(wa_ev_reg_test_data)

    # @ny_registrations = dmv_service.ny_registrations
  end

  describe '#initialize' do 
    it 'exists' do
      expect(@factory).to be_a VehicleFactory
    end

    it 'starts with no vehicles' do 
      expect(@factory.vehicles).to eq([])
    end
  end

  describe '#create_vehicles' do 
    it 'create vehicles from data' do 
      @factory.create_wa_vehicles(wa_ev_reg_test_data)
      
      expect(@factory.vehicles).to_not be_empty
      expect(@factory.vehicles[0]).to be_a Vehicle
    end
    
    it 'washington vehicles have attributes' do 
      @factory.create_wa_vehicles(wa_ev_reg_test_data)

      # CHanged eq expect bellow
      expect(@factory.vehicles[0].vin).to eq('KAT1234KAT')
      expect(@factory.vehicles[0].year).to eq(2022)
      expect(@factory.vehicles[0].make).to eq('TESLA')
      expect(@factory.vehicles[0].model).to eq('Model Y')
    end

    xit 'New York vehicles have attributes' do 
      @factory.create_ny_vehicles(@ny_registrations)
      
      expect(@factory.vehicles[0].vin).to eq('9999236')
      expect(@factory.vehicles[0].year).to eq(1937)
      expect(@factory.vehicles[0].make).to eq('CHRY')
      expect(@factory.vehicles[0].model).to eq('4DSD')
    end
  end


  describe '#engine_type' do 
    it 'can decipher engines' do 
      expect(@factory.engine_type('PROPANE')).to eq(:combustion)
      expect(@factory.engine_type('ELECTRIC')).to eq(:ev)
      expect(@factory.engine_type('AN ACTUAL HORSE')).to eq(:wtf)
    end
  end

  def wa_ev_reg_test_data
    [{:electric_vehicle_type=>"Battery Electric Vehicle (BEV)",
      :vin_1_10=>"KAT1234KAT",
      :dol_vehicle_id=>"197458138",
      :model_year=>"2022",
      :make=>"TESLA",
      :model=>"Model Y",
      :vehicle_primary_use=>"Passenger",
      :electric_range=>"0",
      :odometer_reading=>"0",
      :odometer_code=>"Odometer reading is not collected at time of renewal",
      :new_or_used_vehicle=>"New",
      :sale_price=>"0",
      :base_msrp=>"0",
      :transaction_type=>"Original Registration",
      :transaction_date=>"2022-05-04T00:00:00.000",
      :transaction_year=>"2022",
      :county=>"Thurston",
      :city=>"OLYMPIA",
      :state_of_residence=>"WA",
      :zip=>"98502",
      :non_clean_alternative_fuel=>"HB 2778 Eligiblity Requirements not met",
      :hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility=>"HB 2042 Eligibility Requirements not met",
      :meets_2019_hb_2042_electric_range_requirement=>false,
      :meets_2019_hb_2042_sale_date_requirement=>false,
      :meets_2019_hb_2042_sale_price_value_requirement=>false,
      :_2019_hb_2042_battery_range_requirement=>"No battery range",
      :_2019_hb_2042_purchase_date_requirement=>"Non-sale, registration transaction",
      :_2019_hb_2042_sale_price_value_requirement=>"Non-sale, registration transaction",
      :electric_vehicle_fee_paid=>"No",
      :transportation_electrification_fee_paid=>"No",
      :hybrid_vehicle_electrification_fee_paid=>"No",
      :census_tract_2020=>"53067010520",
      :legislative_district=>"22",
      :electric_utility=>"PUGET SOUND ENERGY INC"},
    {:electric_vehicle_type=>"Battery Electric Vehicle (BEV)",
      :vin_1_10=>"KNDCC3LG2N",
      :dol_vehicle_id=>"177586440",
      :model_year=>"2022",
      :make=>"KIA",
      :model=>"Niro",
      :vehicle_primary_use=>"Passenger",
      :electric_range=>"0",
      :odometer_reading=>"20",
      :odometer_code=>"Actual Mileage",
      :new_or_used_vehicle=>"New",
      :sale_price=>"45419",
      :date_of_vehicle_sale=>"2021-08-23T00:00:00.000",
      :base_msrp=>"0",
      :transaction_type=>"Original Title",
      :transaction_date=>"2021-09-15T00:00:00.000",
      :transaction_year=>"2021",
      :county=>"Thurston",
      :city=>"OLYMPIA",
      :state_of_residence=>"WA",
      :zip=>"98502",
      :non_clean_alternative_fuel=>"HB 2778 Eligiblity Requirements not met",
      :hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility=>"HB 2042 Eligibility Requirements not met",
      :meets_2019_hb_2042_electric_range_requirement=>false,
      :meets_2019_hb_2042_sale_date_requirement=>true,
      :meets_2019_hb_2042_sale_price_value_requirement=>false,
      :_2019_hb_2042_battery_range_requirement=>"No battery range",
      :_2019_hb_2042_purchase_date_requirement=>"Meets purchase date requirement",
      :_2019_hb_2042_sale_price_value_requirement=>"Sale price too high",
      :electric_vehicle_fee_paid=>"Not Applicable",
      :transportation_electrification_fee_paid=>"Not Applicable",
      :hybrid_vehicle_electrification_fee_paid=>"Not Applicable",
      :census_tract_2020=>"53067010520",
      :legislative_district=>"22",
      :electric_utility=>"PUGET SOUND ENERGY INC"},
    {:electric_vehicle_type=>"Battery Electric Vehicle (BEV)",
      :vin_1_10=>"KNDCC3LG2N",
      :dol_vehicle_id=>"177586440",
      :model_year=>"2022",
      :make=>"KIA",
      :model=>"Niro",
      :vehicle_primary_use=>"Passenger",
      :electric_range=>"0",
      :odometer_reading=>"0",
      :odometer_code=>"Odometer reading is not collected at time of renewal",
      :new_or_used_vehicle=>"New",
      :sale_price=>"0",
      :base_msrp=>"0",
      :transaction_type=>"Original Registration",
      :transaction_date=>"2021-09-15T00:00:00.000",
      :transaction_year=>"2021",
      :county=>"Thurston",
      :city=>"OLYMPIA",
      :state_of_residence=>"WA",
      :zip=>"98502",
      :non_clean_alternative_fuel=>"HB 2778 Eligiblity Requirements not met",
      :hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility=>"HB 2042 Eligibility Requirements not met",
      :meets_2019_hb_2042_electric_range_requirement=>false,
      :meets_2019_hb_2042_sale_date_requirement=>false,
      :meets_2019_hb_2042_sale_price_value_requirement=>false,
      :_2019_hb_2042_battery_range_requirement=>"No battery range",
      :_2019_hb_2042_purchase_date_requirement=>"Non-sale, registration transaction",
      :_2019_hb_2042_sale_price_value_requirement=>"Non-sale, registration transaction",
      :electric_vehicle_fee_paid=>"No",
      :transportation_electrification_fee_paid=>"No",
      :hybrid_vehicle_electrification_fee_paid=>"No",
      :census_tract_2020=>"53067010520",
      :legislative_district=>"22",
      :electric_utility=>"PUGET SOUND ENERGY INC"},
    {:electric_vehicle_type=>"Plug-in Hybrid Electric Vehicle (PHEV)",
      :vin_1_10=>"1G1RD6E43E",
      :dol_vehicle_id=>"205937539",
      :model_year=>"2014",
      :make=>"CHEVROLET",
      :model=>"Volt",
      :vehicle_primary_use=>"Passenger",
      :electric_range=>"38",
      :odometer_reading=>"62742",
      :odometer_code=>"Actual Mileage",
      :new_or_used_vehicle=>"Used",
      :sale_price=>"0",
      :date_of_vehicle_sale=>"2019-04-09T00:00:00.000",
      :base_msrp=>"0",
      :transaction_type=>"Original Title",
      :transaction_date=>"2022-06-10T00:00:00.000",
      :transaction_year=>"2022",
      :county=>"Thurston",
      :city=>"OLYMPIA",
      :state_of_residence=>"WA",
      :zip=>"98502",
      :non_clean_alternative_fuel=>"HB 2778 Eligiblity Requirements not met",
      :hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility=>"HB 2042 Eligibility Requirements not met",
      :meets_2019_hb_2042_electric_range_requirement=>true,
      :meets_2019_hb_2042_sale_date_requirement=>false,
      :meets_2019_hb_2042_sale_price_value_requirement=>false,
      :_2019_hb_2042_battery_range_requirement=>"Meets battery range requirement",
      :_2019_hb_2042_purchase_date_requirement=>"Sale before August 2019",
      :_2019_hb_2042_sale_price_value_requirement=>"Non-sale",
      :electric_vehicle_fee_paid=>"Not Applicable",
      :transportation_electrification_fee_paid=>"Not Applicable",
      :hybrid_vehicle_electrification_fee_paid=>"Not Applicable",
      :census_tract_2020=>"53067010520",
      :legislative_district=>"22",
      :electric_utility=>"PUGET SOUND ENERGY INC"}]
  end
end