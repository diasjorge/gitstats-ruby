class AuthorsCommitStats < CommitStats
  include StatsHash

  def initialize
    super
    @hash = Hash.new
  end

  def update(commit)
    super(commit)

    author = commit[:author]
    @hash[author] ||= CommitStats.new
    @hash[author].update(commit)
  end

  def to_json(*a)
    authors = @hash.map do |author, commit_stats|
      commit_stats.to_h.merge(author.to_h)
    end
    {
      commits: commits,
      files_added: files_added,
      files_deleted: files_deleted,
      lines_added: lines_added,
      lines_deleted: lines_deleted,
      files: files,
      lines: lines,
      first_commit: first_commit,
      last_commit: last_commit
    }.merge(authors: authors).to_json(*a)
  end
end
