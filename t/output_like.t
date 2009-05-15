use Test::Tester;
use Test::More tests => 308;
use Test::Output;

use strict;
use warnings;

check_test( sub {
            output_like(sub {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      },
                      qr/OUT/i,
                      qr/ERR/i,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'sub STDOUT and STDOUT matching success'
          );

check_test( sub {
            output_like(sub {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      },
                      qr/OUT/i,
                      undef,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'sub STDOUT matching STDERR ignored success'
          );

check_test( sub {
            output_like(sub {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      },
                      undef,
                      qr/ERR/i,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'sub STDOUT ignored and STDERR matching success'
          );

check_test( sub {
            output_like(sub {
                        print "TEST OUT";
                        print STDERR "TEST ERR";
                      },
                      undef,
                      undef,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDOUT is:\nTEST OUT\nnot:\n\nas expected\nSTDERR is:\nTEST ERR\nnot:\n\nas expected\n",
            },'sub STDOUT ignored and STDERR matching success'
          );

check_test( sub {
            output_like(sub {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      },
                      'OUT',
                      qr/ERR/i,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              depth => 2,
              name => 'output_like_STDOUT',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'sub STDOUT bad regex'
          );

check_test( sub {
            output_like(sub {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      },
                      qr/OUT/i,
                      'OUT',
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              depth => 2,
              name => 'output_like_STDERR',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'sub STDERR bad regex'
          );

check_test( sub {
            output_like(sub {
                        print "TEST OUT";
                        print STDERR "TEST ERR";
                      },
                      qr/out/,
                      qr/ERR/i,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDOUT:\nTEST OUT\ndoesn't match:\n(?-xism:out)\nas expected\n",
            },'sub STDOUT not matching failure'
          );

check_test( sub {
            output_like(sub {
                        print "TEST OUT";
                        print STDERR "TEST ERR";
                      },
                      qr/out/i,
                      qr/err/,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDERR:\nTEST ERR\ndoesn't match:\n(?-xism:err)\nas expected\n",
            },'sub STDERR not matching failure'
          );

check_test( sub {
            output_like(sub {
                        print "TEST OUT";
                        print STDERR "TEST ERR";
                      },
                      qr/out/,
                      qr/err/,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDOUT:\nTEST OUT\ndoesn't match:\n(?-xism:out)\nas expected\nSTDERR:\nTEST ERR\ndoesn't match:\n(?-xism:err)\nas expected\n",
            },'sub STDOUT & STDERR not matching failure'
          );

check_test( sub {
            output_like(sub {
                      },
                      undef,
                      undef,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'sub STDOUT & STDERR undef matching success'
          );

check_test( sub {
            output_like(sub {
                        print STDERR "TEST OUT";
                      },
                      undef,
                      undef,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDERR is:\nTEST OUT\nnot:\n\nas expected\n",
            },'sub STDOUT & STDERR not matching failure'
          );

check_test( sub {
            output_like {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      }
                      qr/OUT/i,
                      qr/ERR/i,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'block STDOUT and STDOUT matching success'
          );

check_test( sub {
            output_like {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      }
                      qr/OUT/i,
                      undef,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'block STDOUT matching STDERR ignored success'
          );

check_test( sub {
            output_like {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      }
                      undef,
                      qr/ERR/i,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'block STDOUT ignored and STDERR matching success'
          );

check_test( sub {
            output_like {
                        print "TEST OUT";
                        print STDERR "TEST ERR";
                      }
                      undef,
                      undef,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDOUT is:\nTEST OUT\nnot:\n\nas expected\nSTDERR is:\nTEST ERR\nnot:\n\nas expected\n",
            },'block STDOUT ignored and STDERR matching success'
          );

check_test( sub {
            output_like {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      }
                      'OUT',
                      qr/ERR/i,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              depth => 2,
              name => 'output_like_STDOUT',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'block STDOUT bad regex'
          );

check_test( sub {
            output_like {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      }
                      qr/OUT/i,
                      'OUT',
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              depth => 2,
              name => 'output_like_STDERR',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'block STDERR bad regex'
          );

check_test( sub {
            output_like {
                        print "TEST OUT";
                        print STDERR "TEST ERR";
                      }
                      qr/out/,
                      qr/ERR/i,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDOUT:\nTEST OUT\ndoesn't match:\n(?-xism:out)\nas expected\n",
            },'block STDOUT not matching failure'
          );

check_test( sub {
            output_like {
                        print "TEST OUT";
                        print STDERR "TEST ERR";
                      }
                      qr/out/i,
                      qr/err/,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDERR:\nTEST ERR\ndoesn't match:\n(?-xism:err)\nas expected\n",
            },'block STDERR not matching failure'
          );

check_test( sub {
            output_like {
                        print "TEST OUT";
                        print STDERR "TEST ERR";
                      }
                      qr/out/,
                      qr/err/,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDOUT:\nTEST OUT\ndoesn't match:\n(?-xism:out)\nas expected\nSTDERR:\nTEST ERR\ndoesn't match:\n(?-xism:err)\nas expected\n",
            },'block STDOUT & STDERR not matching failure'
          );

check_test( sub {
            output_like {
                      }
                      undef,
                      undef,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'block STDOUT & STDERR undef matching success'
          );

check_test( sub {
            output_like {
                        print STDERR "TEST OUT";
                      }
                      undef,
                      undef,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDERR is:\nTEST OUT\nnot:\n\nas expected\n",
            },'block STDOUT & STDERR not matching failure'
          );

check_test( sub {
            output_like(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      qr/OUT/i,
                      qr/ERR/i,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'sub STDOUT and STDOUT matching success'
          );

check_test( sub {
            output_like(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      qr/OUT/i,
                      undef,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'sub STDOUT matching STDERR ignored success'
          );

check_test( sub {
            output_like(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      undef,
                      qr/ERR/i,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'sub STDOUT ignored and STDERR matching success'
          );

check_test( sub {
            output_like(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      undef,
                      undef,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDOUT is:\nTEST OUT\nnot:\n\nas expected\nSTDERR is:\nTEST ERR\nnot:\n\nas expected\n",
            },'sub STDOUT ignored and STDERR matching success'
          );

check_test( sub {
            output_like(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      'OUT',
                      qr/ERR/i,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              depth => 2,
              name => 'output_like_STDOUT',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'sub STDOUT bad regex'
          );

check_test( sub {
            output_like(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      qr/OUT/i,
                      'OUT',
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              depth => 2,
              name => 'output_like_STDERR',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'sub STDERR bad regex'
          );

check_test( sub {
            output_like(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      qr/out/,
                      qr/ERR/i,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDOUT:\nTEST OUT\ndoesn't match:\n(?-xism:out)\nas expected\n",
            },'sub STDOUT not matching failure'
          );

check_test( sub {
            output_like(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      qr/out/i,
                      qr/err/,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDERR:\nTEST ERR\ndoesn't match:\n(?-xism:err)\nas expected\n",
            },'sub STDERR not matching failure'
          );

check_test( sub {
            output_like(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      qr/out/,
                      qr/err/,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDOUT:\nTEST OUT\ndoesn't match:\n(?-xism:out)\nas expected\nSTDERR:\nTEST ERR\ndoesn't match:\n(?-xism:err)\nas expected\n",
            },'sub STDOUT & STDERR not matching failure'
          );

check_test( sub {
            output_like(sub {
                        system("perl", "-e", "exit 0");
                      },
                      undef,
                      undef,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'sub STDOUT & STDERR undef matching success'
          );

check_test( sub {
            output_like(sub {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      },
                      undef,
                      undef,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDERR is:\nTEST OUT\nnot:\n\nas expected\n",
            },'sub STDOUT & STDERR not matching failure'
          );

check_test( sub {
            output_like {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      qr/OUT/i,
                      qr/ERR/i,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'block STDOUT and STDOUT matching success'
          );

check_test( sub {
            output_like {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      qr/OUT/i,
                      undef,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'block STDOUT matching STDERR ignored success'
          );

check_test( sub {
            output_like {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      undef,
                      qr/ERR/i,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'block STDOUT ignored and STDERR matching success'
          );

check_test( sub {
            output_like {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      undef,
                      undef,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDOUT is:\nTEST OUT\nnot:\n\nas expected\nSTDERR is:\nTEST ERR\nnot:\n\nas expected\n",
            },'block STDOUT ignored and STDERR matching success'
          );

check_test( sub {
            output_like {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      'OUT',
                      qr/ERR/i,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              depth => 2,
              name => 'output_like_STDOUT',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'block STDOUT bad regex'
          );

check_test( sub {
            output_like {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      qr/OUT/i,
                      'OUT',
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              depth => 2,
              name => 'output_like_STDERR',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'block STDERR bad regex'
          );

check_test( sub {
            output_like {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      qr/out/,
                      qr/ERR/i,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDOUT:\nTEST OUT\ndoesn't match:\n(?-xism:out)\nas expected\n",
            },'block STDOUT not matching failure'
          );

check_test( sub {
            output_like {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      qr/out/i,
                      qr/err/,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDERR:\nTEST ERR\ndoesn't match:\n(?-xism:err)\nas expected\n",
            },'block STDERR not matching failure'
          );

check_test( sub {
            output_like {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      qr/out/,
                      qr/err/,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDOUT:\nTEST OUT\ndoesn't match:\n(?-xism:out)\nas expected\nSTDERR:\nTEST ERR\ndoesn't match:\n(?-xism:err)\nas expected\n",
            },'block STDOUT & STDERR not matching failure'
          );

check_test( sub {
            output_like {
                        system("perl", "-e", "exit 0");
                      }
                      undef,
                      undef,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'block STDOUT & STDERR undef matching success'
          );

check_test( sub {
            output_like {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      }
                      undef,
                      undef,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDERR is:\nTEST OUT\nnot:\n\nas expected\n",
            },'block STDOUT & STDERR not matching failure'
          );
