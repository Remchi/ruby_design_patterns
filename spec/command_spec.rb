require 'spec_helper'
require_relative '../lib/command'

describe "Command Pattern" do

  describe "Undo" do
    it "can be undone" do
      hero = Hero.new
      turn = Turn.new
      wood = ChopWoodCommand.new(hero)
      heal = HealCharacterCommand.new(hero)
      money = GetMoneyCommand.new(hero)

      turn.make_move(wood)
      turn.make_move(heal)

      expect(hero.wood).to eq(10)
      expect(hero.health).to eq(5)

      turn.undo_move
      expect(hero.health).to eq(0)

      turn.undo_move
      expect(hero.wood).to eq(0)
    end
  end

  describe Reactor do
    it "is fixed if commands are executed in the right order" do
      computer = Computer.new
      computer.add(AmplifyShieldCommand.new)
      computer.add(CalibrateDriverCommand.new)
      computer.add(TestComplierCommand.new)
      computer.add(InstallRegulatorCommand.new)

      reactor = Reactor.new
      expect(reactor.functional?).to be_false

      reactor.fix(computer.execute)
      expect(reactor.functional?).to be_true
    end
  end

  describe Computer do
    let(:computer) { Computer.new }

    before :each do
      computer.add(CalibrateDriverCommand.new)
      computer.add(TestComplierCommand.new)
    end

    it "can add commands to its queue" do
      expect(computer.queue.size).to eq(2)
    end

    it "executes all commands in order" do
      expect(computer.execute).to eq %Q{
Calibrated Uranium-Rod Driver
Tested Jupiter Wave Complier
}
    end
  end

  describe "Commands" do

    describe AmplifyShieldCommand do
      it "amplifies shield" do
        command = AmplifyShieldCommand.new
        expect(command.execute).to eq("Amplified Plutonium-Gamma Shield")
      end
    end

    describe CalibrateDriverCommand do
      it "calibrates driver" do
        command = CalibrateDriverCommand.new
        expect(command.execute).to eq("Calibrated Uranium-Rod Driver")
      end
    end

    describe TestComplierCommand do
      it "tests complier" do
        command = TestComplierCommand.new
        expect(command.execute).to eq("Tested Jupiter Wave Complier")
      end
    end

    describe InstallRegulatorCommand do
      it "installes regulator" do
        command = InstallRegulatorCommand.new
        expect(command.execute).to eq("Installed Hydroelectric Magnetosphere Regulator")
      end
    end

  end

end