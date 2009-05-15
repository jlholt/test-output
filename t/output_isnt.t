use Test::Tester;
use Test::More tests => 336;
use Test::Output;

use strict;
use warnings;

check_test( sub {
            output_isnt(sub {
                        print "TEST OUT\n";
                        print STDERR "TEST OUT"},
                      "TEST OUT STDOUT\n",
                      undef,
                      'Testing STDOUT'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'sub STDOUT not equal success'
          );

check_test( sub {
            output_isnt(sub {
                        print "TEST OUT\n";
                        print STDERR "TEST OUT\n";
                      },
                      undef,
                      "TEST OUT STDERR\n",
                      'Testing STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'sub STDERR not equal success'
          );

check_test( sub {
            output_isnt(sub {
                        print "TEST OUT\n"; 
                        print STDERR "TEST ERR\n";
                      },
                      "TEST OUT STDOUT\n",
                      "TEST ERR STDERR\n",
                      'Testing STDOUT & STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'sub STDOUT & STDERR not equal success'
          );

check_test( sub {
            output_isnt(sub {
                        printf("TEST OUT - %d\n",25);
                        print STDERR "TEST OUT"},
                      "TEST OUT - 42\n",
                      undef,
                      'Testing STDOUT printf'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'sub STDOUT printf not equal success'
          );

check_test( sub {
            output_isnt(sub {
                        printf STDERR ("TEST OUT - %d\n",25);
                      },
                      undef,
                      "TEST OUT - 42\n",
                      'Testing STDERR printf'
                    )
            },{
              ok => 1,
              name => 'Testing STDERR printf',
              diag => '',
            },'sub STDERR printf not equal success'
          );

check_test( sub {
            output_isnt(sub {
                        print "TEST OUT - 25";
                        printf STDERR "TEST OUT - 25";
                      },
                      "TEST OUT - 25",
                      "TEST OUT - 25",
                      'Testing STDOUT & STDERR print'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT & STDERR print',
              diag => "STDOUT:\nTEST OUT - 25\nmatching:\nTEST OUT - 25\nnot expected\nSTDERR:\nTEST OUT - 25\nmatching:\nTEST OUT - 25\nnot expected\n",
            },'sub STDOUT & STDERR matches failure'
          );

check_test( sub {
            output_isnt(sub {
                        print "TEST OUT";
                        print STDERR "TEST OUT"},
                      "TEST OUT",
                      '',
                      'Testing STDOUT failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT:\nTEST OUT\nmatching:\nTEST OUT\nnot expected\n",
            },'sub STDOUT matches failure'
          );

check_test( sub {
            output_isnt(sub {
                      print "TEST OUT";
                      print STDERR "TEST OUT"},
                      '',
                      "TEST OUT",
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDERR:\nTEST OUT\nmatching:\nTEST OUT\nnot expected\n",
            },'sub STDERR matches failure'
          );

check_test( sub {
            output_isnt(sub {
                      print "TEST OUT";
                      print STDERR "TEST OUT"},
                      undef,
                      undef,
                      'Testing STDERR failure'
                    )
            }, {
              ok => 1,
              name => 'Testing STDERR failure',
              diag => '',
            },'sub STDOUT & STDERR not matching success'
          );

check_test( sub {
            output_isnt(sub {
                        print "TEST OUT";
                      },
                      undef,
                      undef,
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDERR:\n\nmatching:\n\nnot expected\n",
            },'sub STDERR matches failure'
          );

check_test( sub {
            output_isnt(sub {
                        print STDERR "TEST OUT";
                      },
                      undef,
                      undef,
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT:\n\nmatching:\n\nnot expected\n",
            },'sub STDOUT matches failure'
          );

check_test( sub {
            output_isnt(sub {
                      },
                      undef,
                      undef,
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT:\n\nmatching:\n\nnot expected\nSTDERR:\n\nmatching:\n\nnot expected\n",
            },'sub STDOUT & STDERR matches failure'
          );

check_test( sub {
            output_isnt {
                        print "TEST OUT\n";
                        print STDERR "TEST OUT"}
                      "TEST OUT STDOUT\n",
                      undef,
                      'Testing STDOUT'
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'block STDOUT not equal success'
          );

check_test( sub {
            output_isnt {
                        print "TEST OUT\n";
                        print STDERR "TEST OUT\n";
                      }
                      undef,
                      "TEST OUT STDERR\n",
                      'Testing STDERR'
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'block STDERR not equal success'
          );

check_test( sub {
            output_isnt {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      }
                      "TEST OUT STDOUT\n",
                      "TEST ERR STDERR\n",
                      'Testing STDOUT & STDERR'
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'block STDOUT & STDERR not equal success'
          );

check_test( sub {
            output_isnt {
                        printf("TEST OUT - %d\n",25);
                        print STDERR "TEST OUT"}
                      "TEST OUT - 42\n",
                      undef,
                      'Testing STDOUT printf'
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'block STDOUT printf not equal success'
          );

check_test( sub {
            output_isnt {
                        printf STDERR ("TEST OUT - %d\n",25);
                      }
                      undef,
                      "TEST OUT - 42\n",
                      'Testing STDERR printf'
            },{
              ok => 1,
              name => 'Testing STDERR printf',
              diag => '',
            },'block STDERR printf not equal success'
          );

check_test( sub {
            output_isnt {
                        print "TEST OUT - 25";
                        printf STDERR "TEST OUT - 25";
                      }
                      "TEST OUT - 25",
                      "TEST OUT - 25",
                      'Testing STDOUT & STDERR print'
            },{
              ok => 0,
              name => 'Testing STDOUT & STDERR print',
              diag => "STDOUT:\nTEST OUT - 25\nmatching:\nTEST OUT - 25\nnot expected\nSTDERR:\nTEST OUT - 25\nmatching:\nTEST OUT - 25\nnot expected\n",
            },'block STDOUT & STDERR matches failure'
          );

check_test( sub {
            output_isnt {
                        print "TEST OUT";
                        print STDERR "TEST OUT"}
                      "TEST OUT",
                      '',
                      'Testing STDOUT failure'
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT:\nTEST OUT\nmatching:\nTEST OUT\nnot expected\n",
            },'block STDOUT matches failure'
          );

check_test( sub {
            output_isnt {
                      print "TEST OUT";
                      print STDERR "TEST OUT"}
                      '',
                      "TEST OUT",
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDERR:\nTEST OUT\nmatching:\nTEST OUT\nnot expected\n",
            },'block STDERR matches failure'
          );

check_test( sub {
            output_isnt {
                      print "TEST OUT";
                      print STDERR "TEST OUT"}
                      undef,
                      undef,
                      'Testing STDERR failure'
            }, {
              ok => 1,
              name => 'Testing STDERR failure',
              diag => '',
            },'block STDOUT & STDERR not matching success'
          );

check_test( sub {
            output_isnt {
                        print "TEST OUT";
                      }
                      undef,
                      undef,
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDERR:\n\nmatching:\n\nnot expected\n",
            },'block STDERR matches failure'
          );

check_test( sub {
            output_isnt {
                        print STDERR "TEST OUT";
                      }
                      undef,
                      undef,
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT:\n\nmatching:\n\nnot expected\n",
            },'block STDOUT matches failure'
          );

check_test( sub {
            output_isnt {
                      }
                      undef,
                      undef,
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT:\n\nmatching:\n\nnot expected\nSTDERR:\n\nmatching:\n\nnot expected\n",
            },'block STDOUT & STDERR matches failure'
          );

check_test( sub {
            output_isnt(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST OUT)")},
                      "TEST OUT STDOUT\n",
                      undef,
                      'Testing STDOUT'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'sub system STDOUT not equal success'
          );

check_test( sub {
            output_isnt(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      },
                      undef,
                      "TEST OUT STDERR\n",
                      'Testing STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'sub system STDERR not equal success'
          );

check_test( sub {
            output_isnt(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      "TEST OUT STDOUT\n",
                      "TEST ERR STDERR\n",
                      'Testing STDOUT & STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'sub system STDOUT & STDERR not equal success'
          );

check_test( sub {
            output_isnt(sub {
                        system("perl", "-e", "printf qq(TEST OUT - %d), 25");
                        system("perl", "-e", "print STDERR qq(TEST OUT)")},
                      "TEST OUT - 42\n",
                      undef,
                      'Testing STDOUT printf'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'sub system STDOUT printf not equal success'
          );

check_test( sub {
            output_isnt(sub {
                        system("perl", "-e", "printf STDERR qq(TEST OUT - %d), 25");
                      },
                      undef,
                      "TEST OUT - 42\n",
                      'Testing STDERR printf'
                    )
            },{
              ok => 1,
              name => 'Testing STDERR printf',
              diag => '',
            },'sub system STDERR printf not equal success'
          );

check_test( sub {
            output_isnt(sub {
                        system("perl", "-e", "print qq(TEST OUT - 25)");
                        system("perl", "-e", "print STDERR qq(TEST OUT - 25)");
                      },
                      "TEST OUT - 25",
                      "TEST OUT - 25",
                      'Testing STDOUT & STDERR print'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT & STDERR print',
              diag => "STDOUT:\nTEST OUT - 25\nmatching:\nTEST OUT - 25\nnot expected\nSTDERR:\nTEST OUT - 25\nmatching:\nTEST OUT - 25\nnot expected\n",
            },'sub system STDOUT & STDERR matches failure'
          );

check_test( sub {
            output_isnt(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST OUT)")},
                      "TEST OUT",
                      '',
                      'Testing STDOUT failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT:\nTEST OUT\nmatching:\nTEST OUT\nnot expected\n",
            },'sub system STDOUT matches failure'
          );

check_test( sub {
            output_isnt(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST OUT)")},
                      '',
                      "TEST OUT",
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDERR:\nTEST OUT\nmatching:\nTEST OUT\nnot expected\n",
            },'sub system STDERR matches failure'
          );

check_test( sub {
            output_isnt(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST OUT)")},
                      undef,
                      undef,
                      'Testing STDERR failure'
                    )
            }, {
              ok => 1,
              name => 'Testing STDERR failure',
              diag => '',
            },'sub system STDOUT & STDERR not matching success'
          );

check_test( sub {
            output_isnt(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                      },
                      undef,
                      undef,
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDERR:\n\nmatching:\n\nnot expected\n",
            },'sub system STDERR matches failure'
          );

check_test( sub {
            output_isnt(sub {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      },
                      undef,
                      undef,
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT:\n\nmatching:\n\nnot expected\n",
            },'sub system STDOUT matches failure'
          );

check_test( sub {
            output_isnt(sub {
                        system("perl", "-e", "exit 0");
                      },
                      undef,
                      undef,
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT:\n\nmatching:\n\nnot expected\nSTDERR:\n\nmatching:\n\nnot expected\n",
            },'sub system STDOUT & STDERR matches failure'
          );

check_test( sub {
            output_isnt {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST OUT)")}
                      "TEST OUT STDOUT\n",
                      undef,
                      'Testing STDOUT'
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'block system STDOUT not equal success'
          );

check_test( sub {
            output_isnt {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      }
                      undef,
                      "TEST OUT STDERR\n",
                      'Testing STDERR'
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'block system STDERR not equal success'
          );

check_test( sub {
            output_isnt {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      "TEST OUT STDOUT",
                      "TEST ERR STDERR",
                      'Testing STDOUT & STDERR'
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'block system STDOUT & STDERR not equal success'
          );

check_test( sub {
            output_isnt {
                        system("perl", "-e", "printf qq(TEST OUT - %d), 25");
                        system("perl", "-e", "print STDERR qq(TEST OUT)")}
                      "TEST OUT - 42\n",
                      undef,
                      'Testing STDOUT printf'
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'block system STDOUT printf not equal success'
          );

check_test( sub {
            output_isnt {
                        system("perl", "-e", "printf STDERR qq(TEST OUT - %d), 25");
                      }
                      undef,
                      "TEST OUT - 42\n",
                      'Testing STDERR printf'
            },{
              ok => 1,
              name => 'Testing STDERR printf',
              diag => '',
            },'block system STDERR printf not equal success'
          );

check_test( sub {
            output_isnt {
                        system("perl", "-e", "print qq(TEST OUT - 25)");
                        system("perl", "-e", "printf STDERR qq(TEST OUT - 25)");
                      }
                      "TEST OUT - 25",
                      "TEST OUT - 25",
                      'Testing STDOUT & STDERR print'
            },{
              ok => 0,
              name => 'Testing STDOUT & STDERR print',
              diag => "STDOUT:\nTEST OUT - 25\nmatching:\nTEST OUT - 25\nnot expected\nSTDERR:\nTEST OUT - 25\nmatching:\nTEST OUT - 25\nnot expected\n",
            },'block system STDOUT & STDERR matches failure'
          );

check_test( sub {
            output_isnt {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST OUT)")}
                      "TEST OUT",
                      '',
                      'Testing STDOUT failure'
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT:\nTEST OUT\nmatching:\nTEST OUT\nnot expected\n",
            },'block system STDOUT matches failure'
          );

check_test( sub {
            output_isnt {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST OUT)")}
                      '',
                      "TEST OUT",
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDERR:\nTEST OUT\nmatching:\nTEST OUT\nnot expected\n",
            },'block system STDERR matches failure'
          );

check_test( sub {
            output_isnt {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST OUT)")}
                      undef,
                      undef,
                      'Testing STDERR failure'
            }, {
              ok => 1,
              name => 'Testing STDERR failure',
              diag => '',
            },'block system STDOUT & STDERR not matching success'
          );

check_test( sub {
            output_isnt {
                        system("perl", "-e", "print qq(TEST OUT)");
                      }
                      undef,
                      undef,
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDERR:\n\nmatching:\n\nnot expected\n",
            },'block system STDERR matches failure'
          );

check_test( sub {
            output_isnt {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      }
                      undef,
                      undef,
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT:\n\nmatching:\n\nnot expected\n",
            },'block system STDOUT matches failure'
          );

check_test( sub {
            output_isnt {
                        system("perl", "-e", "exit 0");
                      }
                      undef,
                      undef,
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT:\n\nmatching:\n\nnot expected\nSTDERR:\n\nmatching:\n\nnot expected\n",
            },'block system STDOUT & STDERR matches failure'
          );
