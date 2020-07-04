import com.intuit.karate.KarateOptions;
import com.intuit.karate.cucumber.KarateStats;
import com.intuit.karate.junit4.Karate;
import org.junit.Test;
import org.junit.runner.RunWith;

import static org.junit.Assert.assertTrue;


@KarateOptions (tags = {"~@ignore"})
public class CucumberRunner {

//This will run all feature files together
    @Test
    public void testParallel(){
        String karateOutputPath = "target/cucumber-html-reports";
        KarateStats stats = com.intuit.karate.cucumber.CucumberRunner.parallel(getClass(), 10, karateOutputPath);
        assertTrue("there are scenario failures", stats.getFailCount() == 0);

    }

    }