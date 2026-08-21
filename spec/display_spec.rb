require_relative "../lib/display"

describe Display do
  describe "#show_board" do
    subject(:display_nothing) { described_class.new }
    context "when it has no board" do
      it "says 'nothing to show" do
        allow(display_nothing).to receive(:puts).with("Nothing to show.").once
        display_nothing.show_board
      end
    end
  end
end
