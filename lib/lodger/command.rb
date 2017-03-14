module Lodger
  require 'claide'
  require 'xcodeproj'

  class Command < CLAide::Command
    DEFAULT_TEST_FILE_NAME_PATTERN = /(^(Stub|Mock|Spy|Tests?)|(Stub|Mock|Spy|Tests?)$)/

    self.command = 'lodger'
    self.version = VERSION

    def initialize(argv)
      @xcproj_path = argv.shift_argument
      @production_target_name = argv.shift_argument #argv.option('production')
      @test_target_name = argv.shift_argument       #argv.option('test')
      @test_file_name_pattern = argv.option('pattern', DEFAULT_TEST_FILE_NAME_PATTERN)
      super
    end

    def run
      project = Xcodeproj::Project.open(@xcproj_path)
      from = extract_target(project, @production_target_name)
      to = extract_target(project, @test_target_name)
      test_files = extract_test_files(from, @test_file_name_pattern)
      transfer_sources!(from, to, test_files)
      project.save()
    end

    def extract_target(project, name)
      project.targets.find do |t|
        t.name == name
      end
    end

    def extract_test_files(target, name_pattern)
      target.source_build_phase.files_references.select do |f|
        name_pattern =~ File.basename(f.path, ".swift")
      end
    end

    def transfer_sources!(from_target, to_target, files_refs)
      files_refs.each do |f|
        from_target.source_build_phase.remove_file_reference(f)
        to_target.source_build_phase.add_file_reference(f)
      end
    end
  end
end
