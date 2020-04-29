require 'json'
require 'msgpack'

begin
  while line = STDIN.gets # continue to read a event from stdin
    line.chomp!

    # Input format depends on exec_filter's in_format setting
    json = JSON.parse(line)

    # main processing. You can do anything, mutate record, access to database and etc.
    json['new_field'] = "Hey from exec_filter script!"

    # Write data to stdout. Output format depends on exec_filter's out_format setting
    STDOUT.print MessagePack.pack(json)

    # Call flush to avoid buffering events
    STDOUT.flush
  end
rescue Interrupt # Ignore Interrupt exception because it happens during exec_filter shutdown
end