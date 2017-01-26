class Admin::DashboardsController < Admin::BaseController
    MISSCLICK_CASES = {
        :"q" => "12wsa", :"w" => "q123edsa", :"e" => "sdfr432w", :"r" => "e345tgfd", :"t" => "r56yhgf", :"y" => "gt67ujh",
        :"u" => "y78ikjh", :"i" => "u89olkj", :"o" => "ki90pl", :"p" => "o0'èòl",:"è" => "p'ì+àò", :"a" => "qwsz<",
        :"s" => "awedxz", :"d" => "serfcx", :"f" => "drtgvc", :"g" => "ftyhbv", :"h" => "gyujnb", :"j" => "huikmn",
        :"k" => "jiol,m", :"l" => "kapò.,", :"ò" => "lpèà-.", :"à" => "òè+ù-", :"ù" => "à+", :"z" => "<asx", :"x" => "zsdc",
        :"c" => "xdfv", :"v" => "cfgb", :"b" => "vghn", :"n" => "bhjm", :"m" => "njk,"
    }

    MAX_MISS_SPELL_CHAR = 3

    def index
        if params[:key].present?
            search_string       = params[:key]

            # Remove special chars to string
            search_string       = search_string.gsub(/[^a-z0-9àèìòù'\s]/i, '').downcase

            words               = search_string.split(' ')
            missing_word_words  = words.uniq - Word.where("value IN (?)", words).map{|w| w.value }

            missing_word_words.each do |word|
                possible_words  = []
                variable_words  = []
                iter_count      = ("1" * word.length).to_i(2)
                word_length     = word.length

                # for i in 1..iter_count
                #     bin             = ("%0#{word.length}d" % i.to_s(2).to_i).chars
                #     bin_length      = bin.length
                #     tmp_word_chars  = word.chars
                #
                #     for j in 1..bin_length
                #         if bin[j - 1].to_i == 1
                #             tmp_word_chars[j - 1] = '.'
                #         end
                #     end
                #
                #     variable_words << tmp_word_chars.join('')
                # end

                for i in 1..MAX_MISS_SPELL_CHAR
                    for j in 0...(word_length - (i - 1))
                        tmp_word_chars = word.chars.clone
                        tmp_word_chars[j] = '$'

                        if i > 1
                            for k in (j + 1)...(word_length)
                                tmp_word_chars_2 = tmp_word_chars.clone
                                tmp_word_chars_2[k] = '$'

                                if i > 2
                                    for l in (k + 1)...(word_length)
                                        tmp_word_chars_3 = tmp_word_chars_2.clone
                                        tmp_word_chars_3[l] = '$'

                                        possible_words << tmp_word_chars_3.join('')
                                    end
                                else
                                    possible_words << tmp_word_chars_2.join('')
                                end
                            end
                        else
                            possible_words << tmp_word_chars.join('')
                        end
                    end
                end

                raise


                variable_words.select! do |var_word|
                    (var_word.length - var_word.gsub('.', '').length) <= 2
                end

                regexp          = '^(' + variable_words.join('|') + ')$'

                correct_words   = Word.where("value REGEXP '#{regexp}'").map{|w| w.value }
                                        .sort { |a, b| String.levenshtein(word, a) <=> String.levenshtein(word, b) }
                # raise
                #
                # correct_word    = Word.where("value IN (?)", possible_words).map{|w| w.value }
                #                         .sort { |a, b| String.levenshtein(word, a) <=> String.levenshtein(word, b) }[0]

                words = words.replace_all(word, correct_words[0])
            end

            @worked_str = words.join(' ')
        end
    end

    private
        def secret_search_code(results, original_word, variable_word)
            variable_index  = variable_word.index("$")
            missclick_chars = MISSCLICK_CASES[original_word[variable_index].to_sym].chars

            missclick_chars.each do |miss_char|
                tmp_var_char                    = variable_word.dup
                tmp_var_char[variable_index]    = miss_char

                if(tmp_var_char.join('').index('$') == nil)
                    results << tmp_var_char.join('')
                else
                    secret_search_code(results, original_word, tmp_var_char)
                end
            end
        end

        def set_resources

        end
end
