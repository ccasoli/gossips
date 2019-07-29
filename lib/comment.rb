
class Comment
    attr_accessor :id_gossip, :content

    def initialize(id_gossip, content)
        @id_gossip = id_gossip
        @content = content
    end

    def save 
        CSV.open('db/comment.csv', 'ab') {|csv| csv << [@id_gossip, @content]}
    end

    def self.all(id_gossip)
        array_comments = []
        CSV.read('db/comment.csv').each do |line| 
            if line[0].to_i == id_gossip
                array_comments << Comment.new(line[0], line[1]) 
            end
        end
        array_comments
    end
end