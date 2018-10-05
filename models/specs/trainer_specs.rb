require("minitest/autorun")
require_relative("../trainer.rb")

class TestTrainer < MiniTest::Test

  def setup()
    options = {"id" => 1, "name" => "Terry"}

    @trainer1 = Trainer.new(options)
  end

  def test_trainer_name
    result = @trainer1.name
    assert_equal("Terry", result)
  end

end
