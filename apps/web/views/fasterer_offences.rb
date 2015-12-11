module Web::Views
  class FastererOffences
    def self.details
      {
        parallel_assignment: {
          fast_ruby_repo: 'parallel-assignment-vs-sequential-assignment-code',
          pretty_title: 'Parallel Assignment vs Sequential Assignment',
          explanation: 'sequential assignment is slower than parallel assignment'
        },
        each_with_index_vs_while: {
          fast_ruby_repo: 'enumerableeach_with_index-vs-while-loop-code',
          pretty_title: 'Enumerable#each_with_index vs while loop',
          explanation: 'Enumerable#each_with_index is slower than while loop'
        },
        rescue_vs_respond_to: {
          fast_ruby_repo: 'beginrescue-vs-respond_to-for-control-flow-code',
          pretty_title: 'begin...rescue vs respond_to? for Control Flow',
          explanation: 'begin...rescue is slower then respond_to?'
        },
        module_eval: {
          fast_ruby_repo: 'define_method-vs-module_eval-for-defining-methods-code',
          pretty_title: 'define_method vs module_eval for Defining Methods',
          explanation: 'module_eval is slower than define_method'
        },
        shuffle_first_vs_sample: {
          fast_ruby_repo: 'arrayshufflefirst-vs-arraysample-code',
          pretty_title: 'Array#shuffle.first vs Array#sample',
          explanation: 'Array#shuffle.first is slower than Array#sample'
        },
        for_loop_vs_each: {
          fast_ruby_repo: 'enumerableeach-vs-for-loop-code',
          pretty_title: 'Enumerable#each vs for loop',
          explanation: 'for loop is slower than Enumerable#each'
        },
        map_flatten_vs_flat_map: {
          fast_ruby_repo: 'enumerablemaparrayflatten-vs-enumerableflat_map-code',
          pretty_title: 'Enumerable#map...Array#flatten vs Enumerable#flat_map',
          explanation: 'Array#map.flatten(1) is slower than Array#flat_map'
        },
        reverse_each_vs_reverse_each: {
          fast_ruby_repo: 'enumerablereverseeach-vs-enumerablereverse_each-code',
          pretty_title: 'Enumerable#reverse.each vs Enumerable#reverse_each',
          explanation: 'Array#reverse.each is slower than Array#reverse_each'
        },
        select_first_vs_detect: {
          fast_ruby_repo: 'enumerabledetect-vs-enumerableselectfirst-code',
          pretty_title: 'Enumerable#detect vs Enumerable#select.first',
          explanation: 'Array#select.first is slower than Array#detect'
        },
        sort_vs_sort_by: {
          fast_ruby_repo: 'enumerablesort-vs-enumerablesort_by-code',
          pretty_title: 'Enumerable#sort vs Enumerable#sort_by',
          explanation: 'Enumerable#sort is slower than Enumerable#sort_by'
        },
        fetch_with_argument_vs_block: {
          fast_ruby_repo: 'hashfetch-with-argument-vs-hashfetch--block-code',
          pretty_title: 'Hash#fetch with argument vs Hash#fetch + block',
          explanation: 'Hash#fetch with second argument is slower than Hash#fetch with block'
        },
        keys_each_vs_each_key: {
          fast_ruby_repo: 'hasheach_key-instead-of-hashkeyseach-code',
          pretty_title: 'Hash#each_key instead of Hash#keys.each',
          explanation: 'Hash#keys.each is slower than Hash#each_key'
        },
        hash_merge_bang_vs_hash_brackets: {
          fast_ruby_repo: 'hashmerge-vs-hash-code',
          pretty_title: 'Hash#merge! vs Hash#[]=',
          explanation: 'Hash#merge! with one argument is slower than Hash#[]'
        },
        block_vs_symbol_to_proc: {
          fast_ruby_repo: 'block-vs-symbolto_proc-code',
          pretty_title: 'Block vs Symbol#to_proc',
          explanation: 'block syntax is slower than Symbol#to_proc'
        },
        proc_call_vs_yield: {
          fast_ruby_repo: 'proccall-vs-yield-code',
          pretty_title: 'Proc#call vs yield',
          explanation: 'Proc#call is sloweer than yield'
        },
        gsub_vs_tr: {
          fast_ruby_repo: 'stringgsub-vs-stringtr-code',
          pretty_title: 'String#gsub vs String#tr',
          explanation: 'String#tr is faster than String#gsub when replacing single character'
        },
        select_last_vs_reverse_detect: {
          fast_ruby_repo: 'enumerableselectlast-vs-enumerablereversedetect-code',
          pretty_title: 'Enumerable#select.last vs Enumerable#reverse.detect',
          explanation: 'Array#select.last is slower than Array#reverse.detect'
        },
        getter_vs_attr_reader: {
          fast_ruby_repo: 'attr_accessor-vs-getter-and-setter-code',
          pretty_title: 'attr_reader vs getter'
        },
        setter_vs_attr_writer: {
          fast_ruby_repo: 'attr_accessor-vs-getter-and-setter-code',
          pretty_title: 'attr_writer vs setter'
        },
        include_vs_cover_on_range: {
          fast_ruby_repo: 'cover-vs-include-code',
          pretty_title: 'cover? vs include?',
          explanation: '#cover? is faster than #include?'
        }
      }
    end
  end
end
