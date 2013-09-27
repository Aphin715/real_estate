require 'spec_helper'

describe Owner do
  it {should have_many(:buildings)}

  it { should have_valid(:first_name).when('Alex', 'John') }
  it { should_not have_valid(:first_name).when('', nil) }

  it { should have_valid(:last_name).when('Smith', 'Griffey') }
  it { should_not have_valid(:last_name).when('', nil) }

  it { should have_valid(:email).when('Alex@phin.com', 'User@example.com') }
  it { should_not have_valid(:email).when('', nil, 'A@','alex.com') }


end
