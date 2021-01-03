# AutomaticTestsPJWSTK

C:\Users\pazwik\Desktop\studia\semestr 7\TestyAutomatyczne\JavaWorkspace\KalkulatorJava\TAUlab3>mvn clean install
[INFO] Scanning for projects...
[INFO]
[INFO] -----------------< pl.s16217:kalukaltoryIprzeliczniki >-----------------
[INFO] Building rozszezony opis 1.0
[INFO] --------------------------------[ jar ]---------------------------------
[INFO]
[INFO] --- maven-clean-plugin:2.5:clean (default-clean) @ kalukaltoryIprzeliczniki ---
[INFO] Deleting C:\Users\pazwik\Desktop\studia\semestr 7\TestyAutomatyczne\JavaWorkspace\KalkulatorJava\TAUlab3\target
[INFO]
[INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ kalukaltoryIprzeliczniki ---
[WARNING] Using platform encoding (Cp1252 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] Copying 1 resource
[INFO]
[INFO] --- maven-compiler-plugin:3.8.1:compile (default-compile) @ kalukaltoryIprzeliczniki ---
[INFO] Changes detected - recompiling the module!
[WARNING] File encoding has not been set, using platform encoding Cp1252, i.e. build is platform dependent!
[INFO] Compiling 7 source files to C:\Users\pazwik\Desktop\studia\semestr 7\TestyAutomatyczne\JavaWorkspace\KalkulatorJava\TAUlab3\target\classes
[INFO]
[INFO] --- maven-resources-plugin:2.6:testResources (default-testResources) @ kalukaltoryIprzeliczniki ---
[WARNING] Using platform encoding (Cp1252 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] skip non existing resourceDirectory C:\Users\pazwik\Desktop\studia\semestr 7\TestyAutomatyczne\JavaWorkspace\KalkulatorJava\TAUlab3\src\test\resources
[INFO]
[INFO] --- maven-compiler-plugin:3.8.1:testCompile (default-testCompile) @ kalukaltoryIprzeliczniki ---
[INFO] Changes detected - recompiling the module!
[WARNING] File encoding has not been set, using platform encoding Cp1252, i.e. build is platform dependent!
[INFO] Compiling 1 source file to C:\Users\pazwik\Desktop\studia\semestr 7\TestyAutomatyczne\JavaWorkspace\KalkulatorJava\TAUlab3\target\test-classes
[INFO]
[INFO] --- maven-surefire-plugin:2.12.4:test (default-test) @ kalukaltoryIprzeliczniki ---
[INFO] Surefire report directory: C:\Users\pazwik\Desktop\studia\semestr 7\TestyAutomatyczne\JavaWorkspace\KalkulatorJava\TAUlab3\target\surefire-reports

-------------------------------------------------------
 T E S T S
-------------------------------------------------------
Running test.java.Tests
5.0
15.0
0.0
15.0
15.0
0.0
5.0
5.0
Tests run: 10, Failures: 2, Errors: 0, Skipped: 0, Time elapsed: 0.843 sec <<< FAILURE!
addCalculate2(test.java.Tests)  Time elapsed: 0.706 sec  <<< FAILURE!
java.lang.AssertionError: expected:<0.0> but was:<15.0>
        at org.junit.Assert.fail(Assert.java:89)
        at org.junit.Assert.failNotEquals(Assert.java:835)
        at org.junit.Assert.assertEquals(Assert.java:555)
        at org.junit.Assert.assertEquals(Assert.java:685)
        at test.java.Tests.addCalculate2(Tests.java:30)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:64)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:564)
        at org.junit.runners.model.FrameworkMethod$1.runReflectiveCall(FrameworkMethod.java:59)
        at org.junit.internal.runners.model.ReflectiveCallable.run(ReflectiveCallable.java:12)
        at org.junit.runners.model.FrameworkMethod.invokeExplosively(FrameworkMethod.java:56)
        at org.junit.internal.runners.statements.InvokeMethod.evaluate(InvokeMethod.java:17)
        at org.junit.runners.ParentRunner$3.evaluate(ParentRunner.java:306)
        at org.junit.runners.BlockJUnit4ClassRunner$1.evaluate(BlockJUnit4ClassRunner.java:100)
        at org.junit.runners.ParentRunner.runLeaf(ParentRunner.java:366)
        at org.junit.runners.BlockJUnit4ClassRunner.runChild(BlockJUnit4ClassRunner.java:103)
        at org.junit.runners.BlockJUnit4ClassRunner.runChild(BlockJUnit4ClassRunner.java:63)
        at org.junit.runners.ParentRunner$4.run(ParentRunner.java:331)
        at org.junit.runners.ParentRunner$1.schedule(ParentRunner.java:79)
        at org.junit.runners.ParentRunner.runChildren(ParentRunner.java:329)
        at org.junit.runners.ParentRunner.access$100(ParentRunner.java:66)
        at org.junit.runners.ParentRunner$2.evaluate(ParentRunner.java:293)
        at org.junit.runners.ParentRunner$3.evaluate(ParentRunner.java:306)
        at org.junit.runners.ParentRunner.run(ParentRunner.java:413)
        at org.apache.maven.surefire.junit4.JUnit4Provider.execute(JUnit4Provider.java:252)
        at org.apache.maven.surefire.junit4.JUnit4Provider.executeTestSet(JUnit4Provider.java:141)
        at org.apache.maven.surefire.junit4.JUnit4Provider.invoke(JUnit4Provider.java:112)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:64)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:564)
        at org.apache.maven.surefire.util.ReflectionUtils.invokeMethodWithArray(ReflectionUtils.java:189)
        at org.apache.maven.surefire.booter.ProviderFactory$ProviderProxy.invoke(ProviderFactory.java:165)
        at org.apache.maven.surefire.booter.ProviderFactory.invokeProvider(ProviderFactory.java:85)
        at org.apache.maven.surefire.booter.ForkedBooter.runSuitesInProcess(ForkedBooter.java:115)
        at org.apache.maven.surefire.booter.ForkedBooter.main(ForkedBooter.java:75)

subtractCalculate2(test.java.Tests)  Time elapsed: 0.002 sec  <<< FAILURE!
java.lang.AssertionError: expected:<0.0> but was:<5.0>
        at org.junit.Assert.fail(Assert.java:89)
        at org.junit.Assert.failNotEquals(Assert.java:835)
        at org.junit.Assert.assertEquals(Assert.java:555)
        at org.junit.Assert.assertEquals(Assert.java:685)
        at test.java.Tests.subtractCalculate2(Tests.java:72)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:64)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:564)
        at org.junit.runners.model.FrameworkMethod$1.runReflectiveCall(FrameworkMethod.java:59)
        at org.junit.internal.runners.model.ReflectiveCallable.run(ReflectiveCallable.java:12)
        at org.junit.runners.model.FrameworkMethod.invokeExplosively(FrameworkMethod.java:56)
        at org.junit.internal.runners.statements.InvokeMethod.evaluate(InvokeMethod.java:17)
        at org.junit.runners.ParentRunner$3.evaluate(ParentRunner.java:306)
        at org.junit.runners.BlockJUnit4ClassRunner$1.evaluate(BlockJUnit4ClassRunner.java:100)
        at org.junit.runners.ParentRunner.runLeaf(ParentRunner.java:366)
        at org.junit.runners.BlockJUnit4ClassRunner.runChild(BlockJUnit4ClassRunner.java:103)
        at org.junit.runners.BlockJUnit4ClassRunner.runChild(BlockJUnit4ClassRunner.java:63)
        at org.junit.runners.ParentRunner$4.run(ParentRunner.java:331)
        at org.junit.runners.ParentRunner$1.schedule(ParentRunner.java:79)
        at org.junit.runners.ParentRunner.runChildren(ParentRunner.java:329)
        at org.junit.runners.ParentRunner.access$100(ParentRunner.java:66)
        at org.junit.runners.ParentRunner$2.evaluate(ParentRunner.java:293)
        at org.junit.runners.ParentRunner$3.evaluate(ParentRunner.java:306)
        at org.junit.runners.ParentRunner.run(ParentRunner.java:413)
        at org.apache.maven.surefire.junit4.JUnit4Provider.execute(JUnit4Provider.java:252)
        at org.apache.maven.surefire.junit4.JUnit4Provider.executeTestSet(JUnit4Provider.java:141)
        at org.apache.maven.surefire.junit4.JUnit4Provider.invoke(JUnit4Provider.java:112)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:64)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:564)
        at org.apache.maven.surefire.util.ReflectionUtils.invokeMethodWithArray(ReflectionUtils.java:189)
        at org.apache.maven.surefire.booter.ProviderFactory$ProviderProxy.invoke(ProviderFactory.java:165)
        at org.apache.maven.surefire.booter.ProviderFactory.invokeProvider(ProviderFactory.java:85)
        at org.apache.maven.surefire.booter.ForkedBooter.runSuitesInProcess(ForkedBooter.java:115)
        at org.apache.maven.surefire.booter.ForkedBooter.main(ForkedBooter.java:75)


Results :

Failed tests:   addCalculate2(test.java.Tests): expected:<0.0> but was:<15.0>
  subtractCalculate2(test.java.Tests): expected:<0.0> but was:<5.0>

Tests run: 10, Failures: 2, Errors: 0, Skipped: 0

[INFO] ------------------------------------------------------------------------
[INFO] BUILD FAILURE
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  5.206 s
[INFO] Finished at: 2021-01-03T15:00:07+01:00
[INFO] ------------------------------------------------------------------------
[ERROR] Failed to execute goal org.apache.maven.plugins:maven-surefire-plugin:2.12.4:test (default-test) on project kalukaltoryIprzeliczniki: There are test failures.
[ERROR]
[ERROR] Please refer to C:\Users\pazwik\Desktop\studia\semestr 7\TestyAutomatyczne\JavaWorkspace\KalkulatorJava\TAUlab3\target\surefire-reports for the individual test results.
[ERROR] -> [Help 1]
[ERROR]
[ERROR] To see the full stack trace of the errors, re-run Maven with the -e switch.
[ERROR] Re-run Maven using the -X switch to enable full debug logging.
[ERROR]
[ERROR] For more information about the errors and possible solutions, please read the following articles:
[ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoFailureException

C:\Users\pazwik\Desktop\studia\semestr 7\TestyAutomatyczne\JavaWorkspace\KalkulatorJava\TAUlab3>
