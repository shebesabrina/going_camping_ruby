# going_camping_ruby

## Initial Setup

1. Clone this repository in one command via the terminal

  ```
  git clone https://github.com/shebesabrina/going_camping_ruby.git
  ```
2. Change directory into the `going_camping_ruby` directory
  ```
  cd going_camping_ruby
  ```

3. Run test suite

  ```
    rspec
  ```

### The repository includes a test-case.json file which is read in a runner file under available_reservations.rb. To review other JSON test-case files simply add the new test-case JSON file in the root directory and update the available_reservations.rb argument on line 6. 

 * In the terminal add a new file in the root directory: `touch new-example-test-case.json`
 * Update line 6 in the available_reservations.rb read argument: `file = File.read("new-example-test-case.json")`
