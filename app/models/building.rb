class Building < ActiveRecord::Base

STATES = %w{AL AK AZ AR CA CO CT DE FL GA HI ID IL
           IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ
           NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY}


  validates_presence_of :city
  validates_presence_of :address
  validates_format_of :postal_code,
                       with: /\A\d{5}-\d{4}|\A\d{5}\z/,
                       message: "should be 12345 or 12345-1234"

  validates_inclusion_of :state, in: STATES




end
