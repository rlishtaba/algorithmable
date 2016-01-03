module Algorithmable
  module Puzzles
    autoload :JosephusProblem, 'algorithmable/puzzles/josephus_problem'
    autoload :DijkstrasTwoStacks, 'algorithmable/puzzles/dijkstras_two_stacks'

    def new_josephus_problem(prisoners, every)
      JosephusProblem.new(prisoners, every)
    end
  end
end
