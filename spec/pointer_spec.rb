require_relative "../lib/pointer"

describe Pointer do
  describe "#move_horizontal" do
    origin = [3, 3]
    subject(:pointer) { described_class.new(origin) }
    context "when moving forwards one step" do
      it "has the same line value, and col increases" do
        expect { pointer.move_horizontal(1) }
          .to change { pointer.current_position[1] }
        expect { pointer.move_horizontal(1) }
          .not_to change { pointer.origin[0] }
        expect { pointer.move_horizontal(1) }
          .not_to change { pointer.origin[1] }
        expect { pointer.move_horizontal(1) }
          .not_to change { pointer.current_position[0] }
      end
    end
      
    context "when moving backwards" do
      it "changes col value by minus one" do
        expect { pointer.move_horizontal(-1) }
          .to change { pointer.current_position[1] }.by(-1)
      end
    end
  end
  describe "#move_vertical" do
    origin = [3, 3]
    subject(:pointer_vertical) { described_class.new(origin) }
    context "when movin forwards one step" do
      it "has the same col value, and line increases" do
        expect { pointer_vertical.move_vertical(1) }
          .to change { pointer_vertical.current_position[0] }
        expect { pointer_vertical.move_vertical(1) }
          .not_to change { pointer_vertical.origin[0] }
        expect { pointer_vertical.move_vertical(1) }
          .not_to change { pointer_vertical.origin[1] }
        expect { pointer_vertical.move_vertical(1) }
          .not_to change { pointer_vertical.current_position[1] }
      end

      context "when moving backwards" do
        it "goes up by minus one" do
          expect { pointer_vertical.move_vertical(-1) }
            .to change { pointer_vertical.current_position[0] }.by(-1) 
        end
      end
    end
  end
end
