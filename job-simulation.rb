# A company has six hiring positions with more people wanting jobs than the
# number of available positions. The company managers decide in order to
# give more people an opportunity to make money; they will allow people to
# work in three-month intervals. The first six people on the waiting list
# will be hired in the order that they are on the waiting list. The first
# six people will keep these positions for three months. At the end of
# three months, the manager will roll a die to determine the number of
# people who will lose their jobs. The company will use the policy of
# last-hired-first-fired. For example, if the die roll is 3, the last 3
# people hired will lose their jobs to the first 3 people on the waiting
# list. People losing their jobs will be placed on the back of the waiting
# list in the order that they are fired. This process will continue for every
# three-month interval.

# Due Sunday Evening -
# git commit, push, and add pull request by Sunday, even if
# you're not done.

require './Stack.rb'
require './Queue.rb'


class CrazyCompany
	attr_accessor :waiting_list, :employed
	MAX_JOBS = 6
	def initialize(candidates)
		@waiting_list = Queue.new
		@employed = Stack.new
		candidates.each do |candidate|
			self.waiting_list.enqueue(candidate)
		end
	end

	def roll
		die = rand(1..6)
		puts "The roll is #{die}"
		return die
	end

	def hire
		until @employed.size == MAX_JOBS
			incoming = @waiting_list.dequeue
			@employed.push(incoming)
		end
	end

	def fire
		number_fired = roll

		number_fired.times do
			outgoing = @employed.pop
			@waiting_list.enqueue(outgoing)
		end
		hire
	end
end
