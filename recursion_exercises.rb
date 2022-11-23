def rec_range(start, finish)
    return [] if finish < start
    return [finish] if finish == start

    final = rec_range(start, finish - 1)

    final << start
end

def it_range(start, finish)
    return [] if finish < start
    (start..finish).map { |ele| ele }
end

# p it_range(1, 5)
# p rec_range(1, 5)