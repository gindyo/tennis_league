class NilPlayer < Player
  after_initialize :after_init
  def after_init
    @is_nil = true
  end
  def ranking_points_entries
    []
  end

end

