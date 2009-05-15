use Test::Tester;
use Test::More tests => 196;
use Test::Output;

use strict;
use warnings;

check_test( sub {
            combined_isnt(sub {
                        print "TEST OUT";
                      },
                      "TEST STDOUT",
                      'Testing STDOUT'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'sub STDOUT not matching success'
          );

check_test( sub {
            combined_isnt(sub {
                        print STDERR "TEST OUT";
                      },
                      "TEST STDERR",
                      'Testing STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'sub STDERR not matching success'
          );

check_test( sub {
            combined_isnt(sub {
                        print "TEST STDOUT"; 
                        print STDERR "TEST STDERR";
                        print "TEST STDOUT AGAIN"; 
                      },
                      "TEST OUTTEST ERRTEST AGAIN",
                      'Testing STDOUT & STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'sub STDOUT & STDERR not matching success'
          );

check_test( sub {
            combined_isnt(sub {
                        printf("TEST OUT - %d",25);
                      },
                      "TEST OUT - 42",
                      'Testing STDOUT printf'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'sub STDOUT printf not matching success'
          );

check_test( sub {
            combined_isnt(sub {
                        print "TEST OUT";
                      },
                      "TEST OUT",
                      'Testing STDOUT failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT & STDERR:\nTEST OUT\nmatching:\nTEST OUT\nnot expected\n",
            },'sub STDOUT matching failure'
          );

check_test( sub {
            combined_isnt(sub {
                      print STDERR "TEST OUT"},
                      "TEST OUT",
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT & STDERR:\nTEST OUT\nmatching:\nTEST OUT\nnot expected\n",
            },'sub STDERR matching failure'
          );

check_test( sub {
            combined_isnt(sub {
                      print "TEST ERR";
                      print STDERR "TEST OUT"},
                      "TEST ERRTEST OUT",
                      'Testing STDOUT & STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDOUT & STDERR failure',
              diag => "STDOUT & STDERR:\nTEST ERRTEST OUT\nmatching:\nTEST ERRTEST OUT\nnot expected\n",
            },'sub STDOUT and STDERR matching failure'
          );

check_test( sub {
            combined_isnt {
                        print "TEST OUT";
                      }
                      "TEST STDOUT",
                      'Testing STDOUT'
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'block STDOUT not matching success'
          );

check_test( sub {
            combined_isnt {
                        print STDERR "TEST OUT";
                      }
                      "TEST STDERR",
                      'Testing STDERR'
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'block STDERR not matching success'
          );

check_test( sub {
            combined_isnt {
                        print "TEST STDOUT"; 
                        print STDERR "TEST STDERR";
                        print "TEST STDOUT AGAIN"; 
                      }
                      "TEST OUTTEST ERRTEST OUT AGAIN",
                      'Testing STDOUT & STDERR'
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'block STDOUT & STDERR not matching success'
          );

check_test( sub {
            combined_isnt {
                        printf("TEST OUT - %d",25);
                      }
                      "TEST OUT - 42",
                      'Testing STDOUT printf'
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'block STDOUT printf not matching success'
          );

check_test( sub {
            combined_isnt {
                        print "TEST OUT";
                      }
                      "TEST OUT",
                      'Testing STDOUT failure'
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT & STDERR:\nTEST OUT\nmatching:\nTEST OUT\nnot expected\n",
            },'block STDOUT matching failure'
          );

check_test( sub {
            combined_isnt {
                      print STDERR "TEST OUT"}
                      "TEST OUT",
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT & STDERR:\nTEST OUT\nmatching:\nTEST OUT\nnot expected\n",
            },'block STDERR not matching failure'
          );

check_test( sub {
            combined_isnt {
                      print "TEST ERR";
                      print STDERR "TEST OUT"}
                      "TEST ERRTEST OUT",
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT & STDERR:\nTEST ERRTEST OUT\nmatching:\nTEST ERRTEST OUT\nnot expected\n",
            },'block STDOUT and STDERR matching failure'
          );

check_test( sub {
            combined_isnt(sub {
						system("perl", "-e", "print qq(TEST OUT)")
                      },
                      "TEST STDOUT",
                      'Testing STDOUT'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'sub system STDOUT not matching success'
          );

check_test( sub {
            combined_isnt(sub {
						system("perl", "-e", "print STDERR qq(TEST OUT)")
                      },
                      "TEST STDERR",
                      'Testing STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'sub system STDERR not matching success'
          );

check_test( sub {
            combined_isnt(sub {
						system("perl", "-e", "print qq(TEST STDOUT)");
						system("perl", "-e", "print STDERR qq(TEST STDERR)");
						system("perl", "-e", "print qq(TEST AGAIN)");
                      },
                      "TEST OUTTEST ERRTEST AGAIN",
                      'Testing STDOUT & STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'sub system STDOUT & STDERR not matching success'
          );

check_test( sub {
            combined_isnt(sub {
                        system("perl", "-e", "printf qq(TEST OUT - %d), 25");
                      },
                      "TEST OUT - 42",
                      'Testing STDOUT printf'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'sub system STDOUT printf not matching success'
          );

check_test( sub {
            combined_isnt(sub {
						system("perl", "-e", "print qq(TEST OUT)");
                      },
                      "TEST OUT",
                      'Testing STDOUT failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT & STDERR:\nTEST OUT\nmatching:\nTEST OUT\nnot expected\n",
            },'sub system STDOUT matching failure'
          );

check_test( sub {
            combined_isnt(sub {
						system("perl", "-e", "print STDERR qq(TEST OUT)")},
                      "TEST OUT",
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT & STDERR:\nTEST OUT\nmatching:\nTEST OUT\nnot expected\n",
            },'sub system STDERR matching failure'
          );

check_test( sub {
            combined_isnt(sub {
						system("perl", "-e", "print qq(TEST ERR)");
						system("perl", "-e", "print STDERR qq(TEST OUT)")},
                      "TEST ERRTEST OUT",
                      'Testing STDOUT & STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDOUT & STDERR failure',
              diag => "STDOUT & STDERR:\nTEST ERRTEST OUT\nmatching:\nTEST ERRTEST OUT\nnot expected\n",
            },'sub system STDOUT and STDERR matching failure'
          );

check_test( sub {
            combined_isnt {
						system("perl", "-e", "print qq(TEST OUT)");
                      }
                      "TEST STDOUT",
                      'Testing STDOUT'
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'block system STDOUT not matching success'
          );

check_test( sub {
            combined_isnt {
						system("perl", "-e", "print STDERR qq(TEST OUT)");
                      }
                      "TEST STDERR",
                      'Testing STDERR'
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'block system STDERR not matching success'
          );

check_test( sub {
            combined_isnt {
						system("perl", "-e", "print qq(TEST STDOUT)");
						system("perl", "-e", "print STDERR qq(TEST STDERR)");
						system("perl", "-e", "print qq(TEST STDOUT AGAIN)");
                      }
                      "TEST OUTTEST ERRTEST OUT AGAIN",
                      'Testing STDOUT & STDERR'
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'block system STDOUT & STDERR not matching success'
          );

check_test( sub {
            combined_isnt {
                        system("perl", "-e", "printf qq(TEST OUT - %d), 25");
                      }
                      "TEST OUT - 42",
                      'Testing STDOUT printf'
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'block system STDOUT printf not matching success'
          );

check_test( sub {
            combined_isnt {
						system("perl", "-e", "print qq(TEST OUT)");
                      }
                      "TEST OUT",
                      'Testing STDOUT failure'
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT & STDERR:\nTEST OUT\nmatching:\nTEST OUT\nnot expected\n",
            },'block system STDOUT matching failure'
          );

check_test( sub {
            combined_isnt {
						system("perl", "-e", "print STDERR qq(TEST OUT)")}
                      "TEST OUT",
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT & STDERR:\nTEST OUT\nmatching:\nTEST OUT\nnot expected\n",
            },'block system STDERR not matching failure'
          );

check_test( sub {
            combined_isnt {
						system("perl", "-e", "print qq(TEST ERR)");
						system("perl", "-e", "print STDERR qq(TEST OUT)")}
                      "TEST ERRTEST OUT",
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT & STDERR:\nTEST ERRTEST OUT\nmatching:\nTEST ERRTEST OUT\nnot expected\n",
            },'block system STDOUT and STDERR matching failure'
          );

