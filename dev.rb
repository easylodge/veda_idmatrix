# Note for gem developer/contributer
# Create file called 'dev_config.yml' in your project root with the following:
#
# url: 'https://ctaau.vedaxml.com/cta/sys2/idmatrix-v4'
# access_code: 'your access code'
# password: 'your password'
#
# run 'bundle console'and then
# load 'dev.rb' to load this seed data

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => ':memory:',
  )
require_relative 'spec/schema'


@config = YAML.load_file('dev_config.yml')
      @access_hash = 
        {
          :url => @config["url"],
          :access_code => @config["access_code"],
          :password => @config["password"]
        }
@entity_hash = {
          :family_name => "Potter",
          :first_given_name => "James",
          :other_given_name => "Harry",
          :date_of_birth => "1980-07-31",
          :gender => "male",
          :current_address => {
            :property => "Potter Manor",
            :unit_number => "3",
            :street_number => "4",
            :street_name => "Privet",
            :street_type => "Drive",
            :suburb => "Little Whinging",
            :state => "NSW",
            :postcode => "2999",
            :unformatted_address => "Potter Manor 3/4 Privet Drive Little Whinging NSW 2999"
          },
          :previous_address => {
            :property => "Veda House",
            :unit_number => "15",
            :street_number => "100",
            :street_name => "Arthur",
            :street_type => "Street",
            :suburb => "North Sydney",
            :state => "NSW",
            :postcode => "2060",
            :unformatted_address => "Veda House 15/100 Arthur Street North Sydney NSW 2060"
          },
          :home_phone_number => "0312345678",
          :mobile_phone_number => "0487654321",
          :work_phone_number => "040012312",
          :phone_authentication_number => "0487654321",
          :send_pin_method => "sms",
          :email_address => "harry.potter@example.com",
          :alternative_email_address => "hpotter@example.com",
          :drivers_licence_state_code => "NSW",
          :drivers_licence_number => "1234567890",
          :drivers_licence_card_number => "123454321",
          :drivers_licence_date_of_expiry => "2000-01-01",
          :drivers_licence_card_number => "1234567890",
          :passport_country_code => "AUS",
          :passport_number => "1234567890",
          :name_at_citizenship => {
            :family_name => "Potter",
            :first_given_name => "Harry",
            :other_given_name => "James"
          },
          :place_of_birth => "Little Whinging",
          :country_of_birth => "AUS",
          :medicare_card_number => "1234567890",
          :medicare_reference_number => "1",
          :birth_cert_reg_number => "12345679890",
          :birth_cert_reg_state =>"NSW",
          :birth_cert_reg_date => "1980-08-02",
          :birth_cert_reg_name => {
            :family_name => "Potter",
            :first_given_name => "Harry",
            :other_given_name => "James"
          },
          :marriage_cert_reg_number => "1234567890",
          :marriage_cert_reg_state => "NSW",
          :marriage_cert_reg_year => "2000",
          :marriage_date => "2000-02-02",
          :brides_name => {
            :family_name => "Wesley",
            :first_given_name => "Ginny"
          },
          :grooms_name => {
            :family_name => "Potter",
            :first_given_name => "Harry",
            :other_given_name => "James"
          },
          :device_intelligence_org_id => "org-abc",
          :device_intelligence_session_id => "X123"
        }

      @enquiry_hash = {
        :client_reference => "123456", 
        :reason_for_enquiry => "Test"
      }  

@req = VedaIdmatrix::Request.new(ref_id: 1, access: @access_hash, entity: @entity_hash, enquiry: @enquiry_hash)
@post = @req.post
@res = VedaIdmatrix::Response.create(xml: @post.body, headers: @post.header, code: @post.code, success: @post.success?, request_id: @req.id)

# puts "This is the result of VedaIdmatrix::Request.access: #{VedaIdmatrix::Request.access}"
puts "You have a @req and @res object to use"


# if VedaIdmatrix::Request.access[:access_code].nil?
#   puts "There is no access_code specified in lib/config/veda_idmatrix.yml"
#   puts "Please add your access code and run this file again"
#   exit
# elsif VedaIdmatrix::Request.access[:password].nil?
#   puts "There is no password specified in lib/config/veda_idmatrix.yml"
#   puts "Please add your password and run this file again"
# elsif VedaIdmatrix::Request.access[:url].nil?
#   puts "You have removed the url in lib/config/veda_idmatrix.yml"
#   puts "It should be 'https://ctaau.vedaxml.com/cta/sys2/idmatrix-v4'"
#   exit
# else
#   puts "Your access details are set!"
# end

  