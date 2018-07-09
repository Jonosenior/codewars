require 'minitest/autorun'

=begin
Dubstep

Polycarpus works as a DJ in the best Berland nightclub, and he often uses dubstep music in his performance. Recently, he has decided to take a couple of old songs and make dubstep remixes from them.

Let's assume that a song consists of some number of words. To make the dubstep remix of this song, Polycarpus inserts a certain number of words "WUB" before the first word of the song (the number may be zero), after the last word (the number may be zero), and between words (at least one between any pair of neighbouring words), and then the boy glues together all the words, including "WUB", in one string and plays the song at the club.

For example, a song with words "I AM X" can transform into a dubstep remix as "WUBWUBIWUBAMWUBWUBX" and cannot transform into "WUBWUBIAMWUBX".

Recently, Jonny has heard Polycarpus's new dubstep track, but since he isn't into modern music, he decided to find out what was the initial song that Polycarpus remixed. Help Jonny restore the original song.

Input
The input consists of a single non-empty string, consisting only of uppercase English letters, the string's length doesn't exceed 200 characters

Output
Return the words of the initial song that Polycarpus used to make a dubsteb remix. Separate the words with a space.

Examples
song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB")
  #  =>  WE ARE THE CHAMPIONS MY FRIEND

=end

def song_decoder(song)
  no_wub = song.gsub 'WUB', ' '
  no_double_spaces = no_wub.gsub /\s{2,}/, ' '
  no_leading_or_trailing_spaces = no_double_spaces.gsub /^ +| +$/, ''
end


class TestSongDecoder < Minitest::Test

  def test_replace_with_one_space
    result = song_decoder("AWUBBWUBC")
    assert_equal "A B C", result, "WUB should be replaced by 1 space"
  end

  def test_multiple_consecutive_wubs
    result = song_decoder("AWUBWUBWUBBWUBWUBWUBC")
    assert_equal "A B C", result, "multiples WUB should be replaced by only 1 space"
  end

  def test_leading_trailing_spaces
    result = song_decoder("WUBAWUBBWUBCWUB")
    assert_equal "A B C", result, "heading or trailing spaces should be removed"
  end

  def test_only_wubs
    result = song_decoder("WUBWUBWUBWUB")
    assert_equal "", result, "a song of only WUBs should return an empty string"
  end
end


# puts song_decoder("WUBAWUBBWUBCWUB")
