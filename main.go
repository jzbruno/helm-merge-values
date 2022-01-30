package main

import (
	"fmt"
	"os"

	flag "github.com/spf13/pflag"
	"helm.sh/helm/v3/pkg/cli"
	"helm.sh/helm/v3/pkg/cli/values"
	"helm.sh/helm/v3/pkg/getter"
	"sigs.k8s.io/yaml"
)

func main() {
	v := values.Options{}

	flag.StringSliceVarP(&v.ValueFiles, "values", "f", []string{}, "path to values files or url")
	flag.StringArrayVar(&v.Values, "set", []string{}, "key value pairs k=v,k=v")
	flag.StringArrayVar(&v.StringValues, "set-string", []string{}, "key values pairs as strings")
	flag.StringArrayVar(&v.FileValues, "set-file", []string{}, "path to files to read key value pairs from")
	flag.Parse()

	merged, err := v.MergeValues(getter.All(cli.New()))
	if err != nil {
		fmt.Printf("failed to merge values, %s", err)
		os.Exit(1)
	}

	mergedBytes, err := yaml.Marshal(merged)
	if err != nil {
		fmt.Printf("failed to marshal values, %s", err)
		os.Exit(1)
	}

	fmt.Println(string(mergedBytes))
}
