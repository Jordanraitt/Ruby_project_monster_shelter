require("minitest/autorun")
require_relative("../family.rb")

class TestFamily< MiniTest::Test

  def setup()
    options  = {"id" => 1, "name" => "Slime"}

    @family1 = Family.new(options)
  end

  def test_family_name
    result = @family1.name
    assert_equal("Slime", result)
  end

end
