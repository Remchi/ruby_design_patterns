require 'spec_helper'
require_relative '../lib/builder'

describe "Builder Pattern" do

  it "validates creation of the board" do
    builder = BoardBuilder.new(2, 5, :easy)
    builder.add_tiles(:plain, 5)

    expect { builder.board }.to raise_exception
  end

  it "creates board" do
    pending
    tiles = []
    tiles << TileFactory.create_plain_tiles(5)
    tiles << TileFactory.create_trap_tiles(5)

    monsters = []
    monsters << MonsterFactory.create_orcs(3)
    monsters << MonsterFactory.create_goblins(5)

    board = Board.new(2, 5, :easy, tiles, monsters)

    expect(board.width).to eq(2)
    expect(board.height).to eq(5)
    expect(board.difficulty).to eq(:easy)
    expect(board.tiles).to eq(tiles)
    expect(board.monsters).to eq(monsters)
  end

  it "uses builder to create board" do
    builder = BoardBuilder.new(2, 5, :easy)
    builder.add_tiles(:plain, 5)
    builder.add_tiles(:trap, 5)
    builder.add_monsters(:orc, 3)
    builder.add_monsters(:goblin, 5)

    board = builder.board

    expect(board.width).to eq(2)
    expect(board.height).to eq(5)
    expect(board.difficulty).to eq(:easy)
    expect(board.tiles.size).to eq(10)
    expect(board.monsters.size).to eq(8)
  end

end