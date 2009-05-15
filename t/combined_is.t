use Test::Tester;
use Test::More tests => 196;
use Test::Output;

use strict;
use warnings;

check_test( sub {
            combined_is(sub {
                        print "TEST OUT";
                      },
                      "TEST OUT",
                      'Testing STDOUT'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'sub STDOUT matches success'
          );

check_test( sub {
            combined_is(sub {
                        print STDERR "TEST OUT";
                      },
                      "TEST OUT",
                      'Testing STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'sub STDERR matches success'
          );

check_test( sub {
            combined_is(sub {
                        print "TEST OUT"; 
                        print STDERR "TEST ERR";
                        print "TEST AGAIN"; 
                      },
                      "TEST OUTTEST ERRTEST AGAIN",
                      'Testing STDOUT & STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'sub STDOUT & STDERR match success'
          );

check_test( sub {
            combined_is(sub {
                        printf("TEST OUT - %d",25);
                      },
                      "TEST OUT - 25",
                      'Testing STDOUT printf'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'sub STDOUT printf match success'
          );

check_test( sub {
            combined_is(sub {
                        print "TEST OUT";
                      },
                      "TEST OUT STDOUT",
                      'Testing STDOUT failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT & STDERR are:\nTEST OUT\nnot:\nTEST OUT STDOUT\nas expected\n",
            },'sub STDOUT not matching failure'
          );

check_test( sub {
            combined_is(sub {
                      print STDERR "TEST OUT"},
                      "TEST OUT STDERR",
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT & STDERR are:\nTEST OUT\nnot:\nTEST OUT STDERR\nas expected\n",
            },'sub STDERR not matching failure'
          );

check_test( sub {
            combined_is(sub {
                      print "TEST ERR";
                      print STDERR "TEST OUT"},
                      "TEST ERR STDOUTTEST OUT STDERR",
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT & STDERR are:\nTEST ERRTEST OUT\nnot:\nTEST ERR STDOUTTEST OUT STDERR\nas expected\n",
            },'sub STDOUT and STDERR not matching failure'
          );

check_test( sub {
            combined_is {
                        print "TEST OUT";
                      }
                      "TEST OUT",
                      'Testing STDOUT'
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'block STDOUT matches success'
          );

check_test( sub {
            combined_is {
                        print STDERR "TEST OUT";
                      }
                      "TEST OUT",
                      'Testing STDERR'
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'block STDERR matches success'
          );

check_test( sub {
            combined_is {
                        print "TEST OUT"; 
                        print STDERR "TEST ERR";
                        print "TEST OUT AGAIN"; 
                      }
                      "TEST OUTTEST ERRTEST OUT AGAIN",
                      'Testing STDOUT & STDERR'
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'block STDOUT & STDERR match success'
          );

check_test( sub {
            combined_is {
                        printf("TEST OUT - %d",25);
                      }
                      "TEST OUT - 25",
                      'Testing STDOUT printf'
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'block STDOUT printf match success'
          );

check_test( sub {
            combined_is {
                        print "TEST OUT";
                      }
                      "TEST OUT STDOUT",
                      'Testing STDOUT failure'
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT & STDERR are:\nTEST OUT\nnot:\nTEST OUT STDOUT\nas expected\n",
            },'block STDOUT not matching failure'
          );

check_test( sub {
            combined_is {
                      print STDERR "TEST OUT"}
                      "TEST OUT STDERR",
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT & STDERR are:\nTEST OUT\nnot:\nTEST OUT STDERR\nas expected\n",
            },'block STDERR not matching failure'
          );

check_test( sub {
            combined_is {
                      print "TEST ERR";
                      print STDERR "TEST OUT"}
                      "TEST ERR STDOUTTEST OUT STDERR",
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT & STDERR are:\nTEST ERRTEST OUT\nnot:\nTEST ERR STDOUTTEST OUT STDERR\nas expected\n",
            },'block STDOUT and STDERR not matching failure'
          );

check_test( sub {
            combined_is {
                        system("perl", "-e", "print qq(TEST OUT)");
                      }
                      "TEST OUT",
                      'Testing system STDOUT'
            },{
              ok => 1,
              name => 'Testing system STDOUT',
              diag => '',
            },'sub system STDOUT matches success'
          );

check_test( sub {
            combined_is(sub {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      },
                      "TEST OUT",
                      'Testing STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'sub system STDERR matches success'
          );

check_test( sub {
            combined_is(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                        system("perl", "-e", "print qq(TEST AGAIN)");
                      },
                      "TEST OUTTEST ERRTEST AGAIN",
                      'Testing STDOUT & STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'sub system STDOUT & STDERR match success'
          );

check_test( sub {
            combined_is(sub {
                        system("perl", "-e", "printf qq(TEST OUT - %d), 25");
                      },
                      "TEST OUT - 25",
                      'Testing STDOUT printf'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'sub system STDOUT printf match success'
          );

check_test( sub {
            combined_is(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                      },
                      "TEST OUT STDOUT",
                      'Testing STDOUT failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT & STDERR are:\nTEST OUT\nnot:\nTEST OUT STDOUT\nas expected\n",
            },'sub system STDOUT not matching failure'
          );

check_test( sub {
            combined_is(sub {
                      system("perl", "-e", "print STDERR qq(TEST OUT)")},
                      "TEST OUT STDERR",
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT & STDERR are:\nTEST OUT\nnot:\nTEST OUT STDERR\nas expected\n",
            },'sub system STDERR not matching failure'
          );

check_test( sub {
            combined_is(sub {
                      system("perl", "-e", "print qq(TEST ERR)");
                      system("perl", "-e", "print STDERR qq(TEST OUT)")},
                      "TEST ERR STDOUTTEST OUT STDERR",
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT & STDERR are:\nTEST ERRTEST OUT\nnot:\nTEST ERR STDOUTTEST OUT STDERR\nas expected\n",
            },'sub system STDOUT and STDERR not matching failure'
          );

check_test( sub {
            combined_is {
                      system("perl", "-e", "print qq(TEST OUT)");
                      }
                      "TEST OUT",
                      'Testing STDOUT'
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'block system STDOUT matches success'
          );

check_test( sub {
            combined_is {
                      system("perl", "-e", "print STDERR qq(TEST OUT)");
                      }
                      "TEST OUT",
                      'Testing STDERR'
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'block system STDERR matches success'
          );

check_test( sub {
            combined_is {
                      system("perl", "-e", "print qq(TEST OUT)");
                      system("perl", "-e", "print STDERR qq(TEST ERR)");
                      system("perl", "-e", "print qq(TEST OUT AGAIN)");
                      }
                      "TEST OUTTEST ERRTEST OUT AGAIN",
                      'Testing STDOUT & STDERR'
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'block system STDOUT & STDERR match success'
          );

check_test( sub {
            combined_is {
                        system("perl", "-e", "printf qq(TEST OUT - %d), 25");
                      }
                      "TEST OUT - 25",
                      'Testing STDOUT printf'
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'block system STDOUT printf match success'
          );

check_test( sub {
            combined_is {
                      system("perl", "-e", "print qq(TEST OUT)");
                      }
                      "TEST OUT STDOUT",
                      'Testing STDOUT failure'
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT & STDERR are:\nTEST OUT\nnot:\nTEST OUT STDOUT\nas expected\n",
            },'block system STDOUT not matching failure'
          );

check_test( sub {
            combined_is {
                      system("perl", "-e", "print STDERR qq(TEST OUT)")}
                      "TEST OUT STDERR",
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT & STDERR are:\nTEST OUT\nnot:\nTEST OUT STDERR\nas expected\n",
            },'block system STDERR not matching failure'
          );

check_test( sub {
            combined_is {
                      system("perl", "-e", "print qq(TEST ERR)");
                      system("perl", "-e", "print STDERR qq(TEST OUT)")}
                      "TEST ERR STDOUTTEST OUT STDERR",
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT & STDERR are:\nTEST ERRTEST OUT\nnot:\nTEST ERR STDOUTTEST OUT STDERR\nas expected\n",
            },'block system STDOUT and STDERR not matching failure'
          );
