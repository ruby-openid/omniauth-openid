# rubocop:disable RSpec/SpecFilePathFormat

RSpec.describe OmniAuth::OpenID::Version do
  it_behaves_like "a Version module", described_class

  it "is greater than 1.0.0" do
    expect(Gem::Version.new(described_class) >= Gem::Version.new("1.0.0")).to be(true)
  end

  it "includes into parent namespace" do
    expect(OmniAuth::OpenID.included_modules).to include(OmniAuth::OpenID::Version)
  end

  it "has VERSION in parent namespace" do
    expect(OmniAuth::OpenID.const_get("VERSION")).to eq(OmniAuth::OpenID::Version::VERSION)
  end
end

# rubocop:enable RSpec/SpecFilePathFormat
