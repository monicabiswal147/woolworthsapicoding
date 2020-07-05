import com.intuit.karate.KarateOptions;
import com.intuit.karate.cucumber.KarateStats;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.Test;
import org.junit.runner.RunWith;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.Assert.assertTrue;


@KarateOptions (tags = {"~@ignore"})
public class CucumberRunner {

//This will run all feature files together
    @Test
    public void testParallel() {
        String karateOutputPath = "target/cucumber-reports";
        KarateStats stats = com.intuit.karate.cucumber.CucumberRunner.parallel(getClass(), 5, karateOutputPath);
        generateReport(karateOutputPath);

        assertTrue("there are scenario failures", stats.getFailCount() == 0);
    }

    //To generate Cucumber HTML reports when scenarios are run in parallel
        private static void generateReport (String karateOutputPath) {
            Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
            List<String> jsonPaths = new ArrayList(jsonFiles.size());
            jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
            Configuration config = new Configuration(new File("target"), "woolworthsapicodingchallenge");
            ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
            reportBuilder.generateReports();
        }

    }

