import time
import os
import po_server,po_manage
import pytest
import unittest
from HTMLunittest import HTMLTestRunner


class mytest():



if __name__ == '__main__':
    # unittest.main()
    test=unittest.TestSuite()
    test.addTest(unittest.makeSuite(mytest))
    with open('%s/test.html'%os.path.abspath('/'), 'ab') as f1:
        runtest=HTMLTestRunner.HTMLTestRunner(stream=f1,verbosity=3,title='lkjloveme')
        runtest.run(test)
        f1.close()



