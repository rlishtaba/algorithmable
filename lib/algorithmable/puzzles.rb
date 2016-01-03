module Algorithmable
  module Puzzles
    autoload :JosephusProblem, 'algorithmable/puzzles/josephus_problem'

    def new_josephus_problem(prisoners, every)
      JosephusProblem.new(prisoners, every)
    end
  end
end
