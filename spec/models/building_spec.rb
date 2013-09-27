require 'spec_helper'

describe Building do
  it { should belong_to(:owner)}

  it { should have_valid(:address).when('605 E. 82nd Street', '123 Main') }
  it { should_not have_valid(:address).when('', nil) }

  it { should have_valid(:city).when('New York', 'Boston') }
  it { should_not have_valid(:city).when('', nil) }

  it { should have_valid(:state).when('NJ', 'NY', 'MA') }
  it { should_not have_valid(:state).when('', nil, 'New York','BX') }

  it { should have_valid(:postal_code).when(10028, 90210, 34343-3432) }
  it { should_not have_valid(:postal_code).when('', nil, 3242123, 2342) }
end
