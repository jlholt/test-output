use Test::Tester;
use Test::More tests => 336;
use Test::Output;

use strict;
use warnings;

check_test( sub {
            output_is(sub {
                        print "TEST OUT";
                      },
                      "TEST OUT",
                      '',
                      'Testing STDOUT'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'sub STDOUT matches success'
          );

check_test( sub {
            output_is(sub {
                        print STDERR "TEST OUT";
                      },
                      '',
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
            output_is(sub {
                        print "TEST OUT"; 
                        print STDERR "TEST ERR";
                      },
                      "TEST OUT",
                      "TEST ERR",
                      'Testing STDOUT & STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'sub STDOUT & STDERR match success'
          );

check_test( sub {
            output_is(sub {
                        printf("TEST OUT - %d",25);
                      },
                      "TEST OUT - 25",
                      '',
                      'Testing STDOUT printf'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'sub STDOUT printf match success'
          );

check_test( sub {
            output_is(sub {
                        print "TEST OUT";
                      },
                      "TEST OUT STDOUT",
                      '',
                      'Testing STDOUT failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT is:\nTEST OUT\nnot:\nTEST OUT STDOUT\nas expected\n",
            },'sub STDOUT not matching failure'
          );

check_test( sub {
            output_is(sub {
                      print STDERR "TEST OUT"},
                      '',
                      "TEST OUT STDERR",
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDERR is:\nTEST OUT\nnot:\nTEST OUT STDERR\nas expected\n",
            },'sub STDERR not matching failure'
          );

check_test( sub {
            output_is(sub {
                      print "TEST ERR";
                      print STDERR "TEST OUT"},
                      'TEST ERR STDOUT',
                      "TEST OUT STDERR",
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT is:\nTEST ERR\nnot:\nTEST ERR STDOUT\nas expected\nSTDERR is:\nTEST OUT\nnot:\nTEST OUT STDERR\nas expected\n",
            },'sub STDOUT and STDERR not matching failure'
          );

check_test( sub {
            output_is(sub {
                        print "TEST OUT"; 
                        print STDERR "TEST ERR";
                      },
                      undef,
                      "TEST ERR",
                      'Testing STDOUT & STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'sub STDOUT undef match success'
          );

check_test( sub {
            output_is(sub {
                        print "TEST OUT"; 
                        print STDERR "TEST ERR";
                      },
                      "TEST OUT",
                      undef,
                      'Testing STDOUT & STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'sub STDOUT match success STDERR undef'
          );

check_test( sub {
            output_is(sub {
                      },
                      undef,
                      undef,
                      'Testing STDOUT & STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'sub STDOUT & STDERR undef match success'
          );

check_test( sub {
            output_is(sub {
                      print "TEST ERR";
                      print STDERR "TEST OUT"},
                      undef,
                      undef,
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT is:\nTEST ERR\nnot:\n\nas expected\nSTDERR is:\nTEST OUT\nnot:\n\nas expected\n",
            },'sub STDOUT and STDERR not matching failure'
          );

check_test( sub {
            output_is(sub {
                      print STDERR "TEST OUT"},
                      undef,
                      undef,
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDERR is:\nTEST OUT\nnot:\n\nas expected\n",
            },'sub STDOUT undef and STDERR not matching failure'
          );

check_test( sub {
            output_is {
                        print "TEST OUT";
                      }
                      "TEST OUT",
                      '',
                      'Testing STDOUT'
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'block STDOUT matches success'
          );

check_test( sub {
            output_is {
                        print STDERR "TEST OUT";
                      }
                      '',
                      "TEST OUT",
                      'Testing STDERR'
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'block STDERR matches success'
          );

check_test( sub {
            output_is {
                        print "TEST OUT"; 
                        print STDERR "TEST ERR";
                      }
                      "TEST OUT",
                      "TEST ERR",
                      'Testing STDOUT & STDERR'
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'block STDOUT & STDERR match success'
          );

check_test( sub {
            output_is {
                        printf("TEST OUT - %d",25);
                      }
                      "TEST OUT - 25",
                      '',
                      'Testing STDOUT printf'
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'block STDOUT printf match success'
          );

check_test( sub {
            output_is {
                        print "TEST OUT";
                      }
                      "TEST OUT STDOUT",
                      '',
                      'Testing STDOUT failure'
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT is:\nTEST OUT\nnot:\nTEST OUT STDOUT\nas expected\n",
            },'block STDOUT not matching failure'
          );

check_test( sub {
            output_is {
                      print STDERR "TEST OUT"}
                      '',
                      "TEST OUT STDERR",
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDERR is:\nTEST OUT\nnot:\nTEST OUT STDERR\nas expected\n",
            },'block STDERR not matching failure'
          );

check_test( sub {
            output_is {
                      print "TEST ERR";
                      print STDERR "TEST OUT"}
                      'TEST ERR STDOUT',
                      "TEST OUT STDERR",
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT is:\nTEST ERR\nnot:\nTEST ERR STDOUT\nas expected\nSTDERR is:\nTEST OUT\nnot:\nTEST OUT STDERR\nas expected\n",
            },'block STDOUT and STDERR not matching failure'
          );

check_test( sub {
            output_is {
                        print "TEST OUT";
                        print STDERR "TEST ERR";
                      }
                      undef,
                      "TEST ERR",
                      'Testing STDOUT & STDERR'
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'block STDOUT undef match success'
          );

check_test( sub {
            output_is {
                        print "TEST OUT"; 
                        print STDERR "TEST ERR";
                      }
                      "TEST OUT",
                      undef,
                      'Testing STDOUT & STDERR'
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'block STDOUT match success STDERR undef'
          );

check_test( sub {
            output_is {
                      }
                      undef,
                      undef,
                      'Testing STDOUT & STDERR'
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'block STDOUT & STDERR undef match success'
          );

check_test( sub {
            output_is {
                      print "TEST ERR";
                      print STDERR "TEST OUT"}
                      undef,
                      undef,
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT is:\nTEST ERR\nnot:\n\nas expected\nSTDERR is:\nTEST OUT\nnot:\n\nas expected\n",
            },'block STDOUT and STDERR not matching failure'
          );

check_test( sub {
            output_is {
                      print STDERR "TEST OUT"}
                      undef,
                      undef,
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDERR is:\nTEST OUT\nnot:\n\nas expected\n",
            },'block STDOUT undef and STDERR not matching failure'
          );

check_test( sub {
            output_is(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                      },
                      "TEST OUT",
                      '',
                      'Testing STDOUT'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'sub system STDOUT matches success'
          );

check_test( sub {
            output_is(sub {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      },
                      '',
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
            output_is(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      "TEST OUT",
                      "TEST ERR",
                      'Testing STDOUT & STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'sub system STDOUT & STDERR match success'
          );

check_test( sub {
            output_is(sub {
                        system("perl", "-e", "printf qq(TEST OUT - %d), 25");
                      },
                      "TEST OUT - 25",
                      '',
                      'Testing STDOUT printf'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'sub system STDOUT printf match success'
          );

check_test( sub {
            output_is(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                      },
                      "TEST OUT STDOUT",
                      '',
                      'Testing STDOUT failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT is:\nTEST OUT\nnot:\nTEST OUT STDOUT\nas expected\n",
            },'sub system STDOUT not matching failure'
          );

check_test( sub {
            output_is(sub {
                        system("perl", "-e", "print STDERR qq(TEST OUT)")},
                      '',
                      "TEST OUT STDERR",
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDERR is:\nTEST OUT\nnot:\nTEST OUT STDERR\nas expected\n",
            },'sub system STDERR not matching failure'
          );

check_test( sub {
            output_is(sub {
                        system("perl", "-e", "print qq(TEST ERR)");
                        system("perl", "-e", "print STDERR qq(TEST OUT)")},
                      'TEST ERR STDOUT',
                      "TEST OUT STDERR",
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT is:\nTEST ERR\nnot:\nTEST ERR STDOUT\nas expected\nSTDERR is:\nTEST OUT\nnot:\nTEST OUT STDERR\nas expected\n",
            },'sub system STDOUT and STDERR not matching failure'
          );

check_test( sub {
            output_is(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      undef,
                      "TEST ERR",
                      'Testing STDOUT & STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'sub system STDOUT undef match success'
          );

check_test( sub {
            output_is(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      "TEST OUT",
                      undef,
                      'Testing STDOUT & STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'sub system STDOUT match success STDERR undef'
          );

check_test( sub {
            output_is(sub {
                        system("perl", "-e", "exit 0");
                      },
                      undef,
                      undef,
                      'Testing STDOUT & STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'sub system STDOUT & STDERR undef match success'
          );

check_test( sub {
            output_is(sub {
                        system("perl", "-e", "print qq(TEST ERR)");
                        system("perl", "-e", "print STDERR qq(TEST OUT)")},
                      undef,
                      undef,
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT is:\nTEST ERR\nnot:\n\nas expected\nSTDERR is:\nTEST OUT\nnot:\n\nas expected\n",
            },'sub system STDOUT and STDERR not matching failure'
          );

check_test( sub {
            output_is(sub {
                        system("perl", "-e", "print STDERR qq(TEST OUT)")},
                      undef,
                      undef,
                      'Testing STDERR failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDERR is:\nTEST OUT\nnot:\n\nas expected\n",
            },'sub system STDOUT undef and STDERR not matching failure'
          );

check_test( sub {
            output_is {
                        system("perl", "-e", "print qq(TEST OUT)");
                      }
                      "TEST OUT",
                      '',
                      'Testing STDOUT'
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'block system STDOUT matches success'
          );

check_test( sub {
            output_is {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      }
                      '',
                      "TEST OUT",
                      'Testing STDERR'
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'block system STDERR matches success'
          );

check_test( sub {
            output_is {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      "TEST OUT",
                      "TEST ERR",
                      'Testing STDOUT & STDERR'
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'block system STDOUT & STDERR match success'
          );

check_test( sub {
            output_is {
                        system("perl", "-e", "printf qq(TEST OUT - %d), 25");
                      }
                      "TEST OUT - 25",
                      '',
                      'Testing STDOUT printf'
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'block system STDOUT printf match success'
          );

check_test( sub {
            output_is {
                        system("perl", "-e", "print qq(TEST OUT)");
                      }
                      "TEST OUT STDOUT",
                      '',
                      'Testing STDOUT failure'
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT is:\nTEST OUT\nnot:\nTEST OUT STDOUT\nas expected\n",
            },'block system STDOUT not matching failure'
          );

check_test( sub {
            output_is {
                        system("perl", "-e", "print STDERR qq(TEST OUT)")}
                      '',
                      "TEST OUT STDERR",
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDERR is:\nTEST OUT\nnot:\nTEST OUT STDERR\nas expected\n",
            },'block system STDERR not matching failure'
          );

check_test( sub {
            output_is {
                        system("perl", "-e", "print qq(TEST ERR)");
                        system("perl", "-e", "print STDERR qq(TEST OUT)")}
                      'TEST ERR STDOUT',
                      "TEST OUT STDERR",
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT is:\nTEST ERR\nnot:\nTEST ERR STDOUT\nas expected\nSTDERR is:\nTEST OUT\nnot:\nTEST OUT STDERR\nas expected\n",
            },'block system STDOUT and STDERR not matching failure'
          );

check_test( sub {
            output_is {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      undef,
                      "TEST ERR",
                      'Testing STDOUT & STDERR'
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'block system STDOUT undef match success'
          );

check_test( sub {
            output_is {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      "TEST OUT",
                      undef,
                      'Testing STDOUT & STDERR'
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'block system STDOUT match success STDERR undef'
          );

check_test( sub {
            output_is {
						system("perl", "-e", "exit 0");
                      }
                      undef,
                      undef,
                      'Testing STDOUT & STDERR'
            },{
              ok => 1,
              name => 'Testing STDOUT & STDERR',
              diag => '',
            },'block system STDOUT & STDERR undef match success'
          );

check_test( sub {
            output_is {
                        system("perl", "-e", "print qq(TEST ERR)");
                        system("perl", "-e", "print STDERR qq(TEST OUT)")}
                      undef,
                      undef,
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDOUT is:\nTEST ERR\nnot:\n\nas expected\nSTDERR is:\nTEST OUT\nnot:\n\nas expected\n",
            },'block system STDOUT and STDERR not matching failure'
          );

check_test( sub {
            output_is {
                        system("perl", "-e", "print STDERR qq(TEST OUT)")}
                      undef,
                      undef,
                      'Testing STDERR failure'
            }, {
              ok => 0,
              name => 'Testing STDERR failure',
              diag => "STDERR is:\nTEST OUT\nnot:\n\nas expected\n",
            },'block system STDOUT undef and STDERR not matching failure'
          );

