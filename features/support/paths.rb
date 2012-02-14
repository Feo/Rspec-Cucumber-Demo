def path_to(page_name)
  case page_name
  when /homepage/
    root_path
  when /signup page/
    signup_path
  else
    raise "Cannot find mapping from \"#{page_name}\" to a path."
  end
end
