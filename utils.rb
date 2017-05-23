require 'etc'

def router_exists?(dir, router_filename='router.php')
  router_file = File.join(dir, router_filename);

  return File.exist? router_file
end

def copy_router(dir, router_filename='router.php')
  # taking some risks here, the router must live in this dir
  copied = Dir.chdir(File.expand_path(File.dirname(__FILE__))) do |path|
    return false unless File.exists? router_filename

    FileUtils.cp(router_filename, dir)
  end

  if copied
    return File.join(dir, router_filename)
  else
    return ''
  end
end

def port_open?(port)
  !system("lsof -i:#{port}", out: '/dev/null')
end

def find_open_port(ideal, max)
  (ideal..max).each do |port|
    return port if port_open?(port)
  end
end

def home
  @home ||= (ENV['HOME'] || "/home/#{Etc.getlogin}")
end

def projects
  @projects ||= home + '/projects'
end
