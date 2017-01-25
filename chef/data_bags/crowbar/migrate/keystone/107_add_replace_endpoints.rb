def upgrade ta, td, a, d
  unless a.key? "replace_endpoints"
    a["replace_endpoints"] = ta["replace_endpoints"]
  end
  return a, d
end

def downgrade ta, td, a, d
  unless ta.key? "replace_endpoints"
    a.delete("replace_endpoints")
  end
  return a, d
end
