require("minitest/autorun")
require_relative("../monster.rb")

class TestMonster< MiniTest::Test

  def setup()
    options = {"id" => 1, "name" => "Slime"}

    @monster1 = Monster.new(options)
  end

  def test_trainer_name
    result = @monster1.name
    assert_equal("Slime", result)
  end

end
