Feature: Save States

  Scenario: Execute create table query
    Given a query to execute for table biz
        """
        CREATE TABLE `biz` (
          `id` int(11) DEFAULT NULL,
          `name` varchar(64) DEFAULT NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8
        """
    Given an expected create table statement for table biz
        """
        CREATE TABLE `biz` (
          `id` int(11) DEFAULT NULL,
          `name` varchar(64) DEFAULT NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8
        """
    When we execute the statement in rbrsource database
    Then schematracker should have correct schema information
    And rbrstate.schema_event_state should have correct state information
    And rbrstate.global_event_state should have correct state information

  Scenario: Execute an alter statement
    Given a query to execute for table biz
        """
        ALTER TABLE `biz` ADD `location` varchar(128) DEFAULT NULL
        """
    Given an expected create table statement for table biz
        """
        CREATE TABLE `biz` (
          `id` int(11) DEFAULT NULL,
          `name` varchar(64) DEFAULT NULL,
          `location` varchar(128) DEFAULT NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8
        """
    When we execute the statement in rbrsource database
    Then schematracker should have correct schema information
    And rbrstate.schema_event_state should have correct state information
    And rbrstate.global_event_state should have correct state information